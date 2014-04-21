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
              | UnknownMode
  deriving (Show, Read, Eq)

instance Enum GameMode where
  fromEnum UnknownMode = -1
  fromEnum NoMode = 0
  fromEnum AllPick = 1
  fromEnum CaptainsMode = 2
  fromEnum RandomDraft = 3
  fromEnum SingleDraft = 4
  fromEnum AllRandom = 5
  fromEnum Intro = 6
  fromEnum Diretide = 7
  fromEnum ReverseCaptainsMode = 8
  fromEnum Greeviling = 9
  fromEnum Tutorial = 10
  fromEnum MidOnly = 11
  fromEnum LeastPlayed = 12
  fromEnum NewPlayerPool = 13
  fromEnum CompendiumMatchmaking = 14
  fromEnum CaptainsDraft = 16

  toEnum 0 = NoMode
  toEnum 1 = AllPick
  toEnum 2 = CaptainsMode
  toEnum 3 = RandomDraft
  toEnum 4 = SingleDraft
  toEnum 5 = AllRandom
  toEnum 6 = Intro
  toEnum 7 = Diretide
  toEnum 8 = ReverseCaptainsMode
  toEnum 9 = Greeviling
  toEnum 10 = Tutorial
  toEnum 11 = MidOnly
  toEnum 12 = LeastPlayed
  toEnum 13 = NewPlayerPool
  toEnum 14 = CompendiumMatchmaking
  toEnum 16 = CaptainsDraft
  toEnum _ = UnknownMode
