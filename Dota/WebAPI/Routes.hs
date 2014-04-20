module Dota.WebAPI.Routes where

import Dota.WebAPI.Types

import Control.Applicative ((<$>))
import Control.Arrow ((***))
import Control.Monad.IO.Class (liftIO)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Maybe (MaybeT(..))
import Control.Monad.Trans.Reader (ask)
import Data.Maybe (isJust, fromJust)
import Data.Monoid ((<>))
import Network.HTTP.Conduit hiding (path)
import qualified Data.ByteString.Lazy as BS
import qualified Data.DateTime as DateTime (toSeconds)
import qualified Data.Text as T
import qualified Data.Text.Encoding as T (encodeUtf8)
import qualified Network.HTTP.Base as HTTP (urlEncodeVars)

type URLFragment = T.Text
type URLParam = (T.Text, Maybe T.Text)

data Route a = Route { fragments :: [URLFragment]
                     , urlParams :: [URLParam]
                     , httpMethod :: T.Text } deriving (Show, Read, Eq)

(=.) :: T.Text -> Maybe T.Text -> URLParam
k =. v = (k, v)

baseURL :: T.Text
baseURL = "https://api.steampowered.com/IDOTA2Match_570/"

runRouteT :: Route a -> WebAPI BS.ByteString
runRouteT route = do
  key <- lift ask
  req <- MaybeT . return $ routeRequest key route
  let req' = req { responseTimeout = Just 10000000 }
  resp <- liftIO $ withManager (httpLbs req')
  return $ responseBody resp

routeURL :: Route a -> T.Text
routeURL (Route fs ps _) = 
  let path = T.intercalate "/" fs
  in baseURL <> path <> "/?" <> buildParams ps

routeRequest :: WebAPIKey -> Route a -> Maybe Request
routeRequest key route = 
  let finalRoute = addAPIKey key route in
  case parseUrl (T.unpack $ routeURL finalRoute) of
    Just url -> Just $ url { method = T.encodeUtf8 (httpMethod route) }
    Nothing -> Nothing

addAPIKey :: WebAPIKey -> Route a -> Route a
addAPIKey key r@(Route _ params _) = r { urlParams = ("key", Just key):params }

buildParams :: [URLParam] -> T.Text
buildParams = T.pack . HTTP.urlEncodeVars . mapBoth T.unpack . dropSndMaybes
  where dropSndMaybes = map (fmap fromJust) . filter (isJust . snd) 
  -- this code is disgusting, fix this shit

mapBoth :: (a -> b) -> [(a, a)] -> [(b, b)]
mapBoth f = map (f *** f)

matchHistoryRoute :: MatchHistorySettings -> Route MatchHistory
matchHistoryRoute mhs = Route [ "GetMatchHistory", "V001" ]
                              [ "player_name" =. withPlayer mhs
                              , "hero_id" =. (T.pack . show <$> withHero mhs)
                              , "league_id" =. (T.pack . show <$> fromLeague mhs)
                              , "matches_requested" =. (T.pack . show <$> matchesLimit mhs)
                              , "date_min" =. (T.pack . show . DateTime.toSeconds <$> afterDate mhs)
                              , "date_max" =. (T.pack . show . DateTime.toSeconds <$> beforeDate mhs)
                              , "start_at_match_id" =. (T.pack . show . pred . unMatchID <$> beforeMatch mhs) ]
                              "GET"

matchDetailsRoute :: MatchID -> Route Match
matchDetailsRoute mID = Route [ "GetMatchDetails", "V001" ]
                              [ "match_id" =. (Just . T.pack . show $ unMatchID mID) ]
                              "GET"

leagueListingRoute :: Route League
leagueListingRoute = Route [ "GetLeagueListing", "v1" ]
                           [ ]
                           "GET"
