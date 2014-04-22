module Dota.WebAPI.Parser where

import Dota.WebAPI.Types as Types

import Data.Aeson
import Text.Read (readMaybe)

tryRead :: (Monad m, Read a) => m String -> m a
tryRead x = do
  v <- x
  case readMaybe v of
    Just t -> return t
    Nothing -> fail $ "Bad read on " ++ v ++ "."

testMatchHistory :: Either String MatchHistory
testMatchHistory = eitherDecode "{\"result\": {\"status\": 1,\"num_results\": 1,\"total_results\": 500,\"results_remaining\": 499,\"matches\": [{\"match_id\": 597709888,\"match_seq_num\": 543509241,\"start_time\": 1396793188,\"lobby_type\": 0,\"players\": [{\"account_id\": 4294967295,\"player_slot\": 0,\"hero_id\": 0},{\"account_id\": 34810503,\"player_slot\": 1,\"hero_id\": 0},{\"account_id\": 4294967295,\"player_slot\": 2,\"hero_id\": 63},{\"account_id\": 4294967295,\"player_slot\": 3,\"hero_id\": 0},{\"account_id\": 4294967295,\"player_slot\": 4,\"hero_id\": 0},{\"account_id\": 4294967295,\"player_slot\": 128,\"hero_id\": 0},{\"account_id\": 4294967295,\"player_slot\": 129,\"hero_id\": 0},{\"account_id\": 4294967295,\"player_slot\": 130,\"hero_id\": 53},{\"account_id\": 4294967295,\"player_slot\": 131,\"hero_id\": 44},{\"account_id\": 4294967295,\"player_slot\": 132,\"hero_id\": 0}]}]}}"
