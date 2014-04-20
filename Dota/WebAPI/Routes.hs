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

import APIBuilder

builder :: Builder
builder = Builder "Dota WebAPI" "https://api.steampowered.com/IDOTA2Match_570" id id

webAPI :: WebAPIKey -> WebAPI a -> IO (Either (APIError ()) a)
webAPI key act = 
  runAPI builder key $ do
    customizeRoute (addAPIKey key)
    act

addAPIKey :: WebAPIKey -> Route -> Route
addAPIKey key r@(Route _ params _) = r { urlParams = ("key", Just key):params }

matchHistoryRoute :: MatchHistorySettings -> Route
matchHistoryRoute mhs = Route [ "GetMatchHistory", "V001" ]
                              [ "player_name" =. withPlayer mhs
                              , "hero_id" =. (T.pack . show <$> withHero mhs)
                              , "league_id" =. (T.pack . show <$> fromLeague mhs)
                              , "matches_requested" =. (T.pack . show <$> matchesLimit mhs)
                              , "date_min" =. (T.pack . show . DateTime.toSeconds <$> afterDate mhs)
                              , "date_max" =. (T.pack . show . DateTime.toSeconds <$> beforeDate mhs)
                              , "start_at_match_id" =. (T.pack . show . pred . unMatchID <$> beforeMatch mhs) ]
                              "GET"

matchDetailsRoute :: MatchID -> Route
matchDetailsRoute mID = Route [ "GetMatchDetails", "V001" ]
                              [ "match_id" =. (Just . T.pack . show $ unMatchID mID) ]
                              "GET"

leagueListingRoute :: Route
leagueListingRoute = Route [ "GetLeagueListing", "v1" ]
                           [ ]
                           "GET"
