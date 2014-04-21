module Dota.WebAPI.Types.GameModes where

data GameMode = NoMode
              | AllPick
              | CaptainsMode
              | RandomDraft
              | SingleDraft
              | AllRandom
              | Intro
              | Diretide
              | ReverseCaptainsMode
              | Greeviling
              | Tutorial
              | MidOnly
              | LeastPlayed
              | NewPlayerPool
              | CompendiumMatchmaking
              | CaptainsDraft
  deriving (Show, Read, Eq, Enum)
