module Dota.WebAPI.Types.Heroes where

data Hero = UnknownHero
          | Antimage
          | Axe
          | Bane
          | Bloodseeker
          | CrystalMaiden
          | DrowRanger
          | Earthshaker
          | Juggernaut
          | Mirana
          | ShadowFiend
          | Morphling
          | PhantomLancer
          | Puck
          | Pudge
          | Razor
          | SandKing
          | StormSpirit
          | Sven
          | Tiny
          | VengefulSpirit
          | Windrunner
          | Zeus
          | Kunkka
          | Lina
          | Lich
          | Lion
          | ShadowShaman
          | Slardar
          | Tidehunter
          | WitchDoctor
          | Riki
          | Enigma
          | Tinker
          | Sniper
          | Necrophos
          | Warlock
          | Beastmaster
          | QueenOfPain
          | Venomancer
          | FacelessVoid
          | WraithKing
          | DeathProphet
          | PhantomAssassin
          | Pugna
          | TemplarAssassin
          | Viper
          | Luna
          | DragonKnight
          | Dazzle
          | Clockwerk
          | Leshrac
          | NaturesProphet
          | Lifestealer
          | DarkSeer
          | Clinkz
          | Omniknight
          | Enchantress
          | Huskar
          | NightStalker
          | Broodmother
          | BountyHunter
          | Weaver
          | Jakiro
          | Batrider
          | Chen
          | Spectre
          | Doom
          | AncientApparition
          | Ursa
          | SpiritBreaker
          | Gyrocopter
          | Alchemist
          | Invoker
          | Silencer
          | OutworldDevourer
          | Lycan
          | Brewmaster
          | ShadowDemon
          | LoneDruid
          | ChaosKnight
          | Meepo
          | TreantProtector
          | OgreMagi
          | Undying
          | Rubick
          | Disruptor
          | NyxAssassin
          | NagaSiren
          | KeeperOfTheLight
          | Io
          | Visage
          | Slark
          | Medusa
          | TrollWarlord
          | Centaur
          | Magnus
          | Timbersaw
          | Bristleback
          | Tusk
          | SkywrathMage
          | Abaddon
          | ElderTitan
          | LegionCommander
          | EmberSpirit
          | EarthSpirit
          | AbyssalUnderlord
          | Terrorblade
          | Phoenix
  deriving (Show)

instance Enum Hero where
  fromEnum = fromIntegral . heroToID
  toEnum = heroFromID . fromIntegral

heroFromID :: Integer -> Hero
heroFromID 1 = Antimage
heroFromID 2 = Axe
heroFromID 3 = Bane
heroFromID 4 = Bloodseeker
heroFromID 5 = CrystalMaiden
heroFromID 6 = DrowRanger
heroFromID 7 = Earthshaker
heroFromID 8 = Juggernaut
heroFromID 9 = Mirana
heroFromID 11 = ShadowFiend
heroFromID 10 = Morphling
heroFromID 12 = PhantomLancer
heroFromID 13 = Puck
heroFromID 14 = Pudge
heroFromID 15 = Razor
heroFromID 16 = SandKing
heroFromID 17 = StormSpirit
heroFromID 18 = Sven
heroFromID 19 = Tiny
heroFromID 20 = VengefulSpirit
heroFromID 21 = Windrunner
heroFromID 22 = Zeus
heroFromID 23 = Kunkka
heroFromID 25 = Lina
heroFromID 31 = Lich
heroFromID 26 = Lion
heroFromID 27 = ShadowShaman
heroFromID 28 = Slardar
heroFromID 29 = Tidehunter
heroFromID 30 = WitchDoctor
heroFromID 32 = Riki
heroFromID 33 = Enigma
heroFromID 34 = Tinker
heroFromID 35 = Sniper
heroFromID 36 = Necrophos
heroFromID 37 = Warlock
heroFromID 38 = Beastmaster
heroFromID 39 = QueenOfPain
heroFromID 40 = Venomancer
heroFromID 41 = FacelessVoid
heroFromID 42 = WraithKing
heroFromID 43 = DeathProphet
heroFromID 44 = PhantomAssassin
heroFromID 45 = Pugna
heroFromID 46 = TemplarAssassin
heroFromID 47 = Viper
heroFromID 48 = Luna
heroFromID 49 = DragonKnight
heroFromID 50 = Dazzle
heroFromID 51 = Clockwerk
heroFromID 52 = Leshrac
heroFromID 53 = NaturesProphet
heroFromID 54 = Lifestealer
heroFromID 55 = DarkSeer
heroFromID 56 = Clinkz
heroFromID 57 = Omniknight
heroFromID 58 = Enchantress
heroFromID 59 = Huskar
heroFromID 60 = NightStalker
heroFromID 61 = Broodmother
heroFromID 62 = BountyHunter
heroFromID 63 = Weaver
heroFromID 64 = Jakiro
heroFromID 65 = Batrider
heroFromID 66 = Chen
heroFromID 67 = Spectre
heroFromID 69 = Doom
heroFromID 68 = AncientApparition
heroFromID 70 = Ursa
heroFromID 71 = SpiritBreaker
heroFromID 72 = Gyrocopter
heroFromID 73 = Alchemist
heroFromID 74 = Invoker
heroFromID 75 = Silencer
heroFromID 76 = OutworldDevourer
heroFromID 77 = Lycan
heroFromID 78 = Brewmaster
heroFromID 79 = ShadowDemon
heroFromID 80 = LoneDruid
heroFromID 81 = ChaosKnight
heroFromID 82 = Meepo
heroFromID 83 = TreantProtector
heroFromID 84 = OgreMagi
heroFromID 85 = Undying
heroFromID 86 = Rubick
heroFromID 87 = Disruptor
heroFromID 88 = NyxAssassin
heroFromID 89 = NagaSiren
heroFromID 90 = KeeperOfTheLight
heroFromID 91 = Io
heroFromID 92 = Visage
heroFromID 93 = Slark
heroFromID 94 = Medusa
heroFromID 95 = TrollWarlord
heroFromID 96 = Centaur
heroFromID 97 = Magnus
heroFromID 98 = Timbersaw
heroFromID 99 = Bristleback
heroFromID 100 = Tusk
heroFromID 101 = SkywrathMage
heroFromID 102 = Abaddon
heroFromID 103 = ElderTitan
heroFromID 104 = LegionCommander
heroFromID 106 = EmberSpirit
heroFromID 107 = EarthSpirit
heroFromID 108 = AbyssalUnderlord
heroFromID 109 = Terrorblade
heroFromID 110 = Phoenix
heroFromID _ = UnknownHero

heroToID :: Hero -> Integer
heroToID Antimage = 1
heroToID Axe = 2
heroToID Bane = 3
heroToID Bloodseeker = 4
heroToID CrystalMaiden = 5
heroToID DrowRanger = 6
heroToID Earthshaker = 7
heroToID Juggernaut = 8
heroToID Mirana = 9
heroToID ShadowFiend = 11
heroToID Morphling = 10
heroToID PhantomLancer = 12
heroToID Puck = 13
heroToID Pudge = 14
heroToID Razor = 15
heroToID SandKing = 16
heroToID StormSpirit = 17
heroToID Sven = 18
heroToID Tiny = 19
heroToID VengefulSpirit = 20
heroToID Windrunner = 21
heroToID Zeus = 22
heroToID Kunkka = 23
heroToID Lina = 25
heroToID Lich = 31
heroToID Lion = 26
heroToID ShadowShaman = 27
heroToID Slardar = 28
heroToID Tidehunter = 29
heroToID WitchDoctor = 30
heroToID Riki = 32
heroToID Enigma = 33
heroToID Tinker = 34
heroToID Sniper = 35
heroToID Necrophos = 36
heroToID Warlock = 37
heroToID Beastmaster = 38
heroToID QueenOfPain = 39
heroToID Venomancer = 40
heroToID FacelessVoid = 41
heroToID WraithKing = 42
heroToID DeathProphet = 43
heroToID PhantomAssassin = 44
heroToID Pugna = 45
heroToID TemplarAssassin = 46
heroToID Viper = 47
heroToID Luna = 48
heroToID DragonKnight = 49
heroToID Dazzle = 50
heroToID Clockwerk = 51
heroToID Leshrac = 52
heroToID NaturesProphet = 53
heroToID Lifestealer = 54
heroToID DarkSeer = 55
heroToID Clinkz = 56
heroToID Omniknight = 57
heroToID Enchantress = 58
heroToID Huskar = 59
heroToID NightStalker = 60
heroToID Broodmother = 61
heroToID BountyHunter = 62
heroToID Weaver = 63
heroToID Jakiro = 64
heroToID Batrider = 65
heroToID Chen = 66
heroToID Spectre = 67
heroToID Doom = 69
heroToID AncientApparition = 68
heroToID Ursa = 70
heroToID SpiritBreaker = 71
heroToID Gyrocopter = 72
heroToID Alchemist = 73
heroToID Invoker = 74
heroToID Silencer = 75
heroToID OutworldDevourer = 76
heroToID Lycan = 77
heroToID Brewmaster = 78
heroToID ShadowDemon = 79
heroToID LoneDruid = 80
heroToID ChaosKnight = 81
heroToID Meepo = 82
heroToID TreantProtector = 83
heroToID OgreMagi = 84
heroToID Undying = 85
heroToID Rubick = 86
heroToID Disruptor = 87
heroToID NyxAssassin = 88
heroToID NagaSiren = 89
heroToID KeeperOfTheLight = 90
heroToID Io = 91
heroToID Visage = 92
heroToID Slark = 93
heroToID Medusa = 94
heroToID TrollWarlord = 95
heroToID Centaur = 96
heroToID Magnus = 97
heroToID Timbersaw = 98
heroToID Bristleback = 99
heroToID Tusk = 100
heroToID SkywrathMage = 101
heroToID Abaddon = 102
heroToID ElderTitan = 103
heroToID LegionCommander = 104
heroToID EmberSpirit = 106
heroToID EarthSpirit = 107
heroToID AbyssalUnderlord = 108
heroToID Terrorblade = 109
heroToID Phoenix = 110
heroToID UnknownHero = -1
