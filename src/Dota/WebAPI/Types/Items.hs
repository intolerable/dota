module Dota.WebAPI.Types.Items where

data Item = UnknownItem
          | NoItem
          | BlinkDagger
          | BladesOfAttack
          | Broadsword
          | Chainmail
          | Claymore
          | HelmOfIronWill
          | Javelin
          | MithrilHammer
          | Platemail
          | Quarterstaff
          | QuellingBlade
          | RingOfProtection
          | StoutShield
          | GauntletsOfStrength
          | SlippersOfAgility
          | MantleOfIntelligence
          | IronBranch
          | BeltOfStrength
          | BootsOfElveskin
          | RobeOfTheMagi
          | CircletOfNobelty
          | OgreClub
          | BladeOfAlacrity
          | StaffOfWizardry
          | UltimateOrb
          | GlovesOfHaste
          | MorbidMask
          | RingOfRegen
          | SagesMask
          | BootsOfSpeed
          | GemOfTrueSight
          | Cloak
          | TalismanOfEvasion
          | Cheese
          | MagicStick
          | RecipeMagicWand
          | MagicWand
          | GhostScepter
          | Clarity
          | Flask
          | Dust
          | Bottle
          | ObserverWard
          | SentryWard
          | Tango
          | AnimalCourier
          | TownPortalScroll
          | RecipeTravelBoots
          | TravelBoots
          | RecipePhaseBoots
          | PhaseBoots
          | DemonEdge
          | Eagle
          | Reaver
          | Relic
          | Hyperstone
          | RingOfHealth
          | VoidStone
          | MysticStaff
          | EnergyBooster
          | PointBooster
          | VitalityBooster
          | RecipePowerTreads
          | PowerTreads
          | RecipeHandOfMidas
          | HandOfMidas
          | RecipeOblivionStaff
          | OblivionStaff
          | RecipePers
          | Pers
          | RecipePoorMansShield
          | PoorMansShield
          | RecipeBracer
          | Bracer
          | RecipeWraithBand
          | WraithBand
          | RecipeNullTalisman
          | NullTalisman
          | RecipeMekansm
          | Mekansm
          | RecipeVladmir
          | Vladmir
          | FlyingCourier
          | RecipeBuckler
          | Buckler
          | RecipeRingOfBasilius
          | RingOfBasilius
          | RecipePipeOfInsight
          | PipeOfInsight
          | RecipeUrnOfShadows
          | UrnOfShadows
          | RecipeHeaddress
          | Headdress
          | RecipeScytheOfVyse
          | ScytheOfVyse
          | RecipeOrchid
          | Orchid
          | RecipeCyclone
          | Cyclone
          | RecipeForceStaff
          | ForceStaff
          | RecipeDagon
          | RecipeDagon2
          | RecipeDagon3
          | RecipeDagon4
          | RecipeDagon5
          | Dagon
          | Dagon2
          | Dagon3
          | Dagon4
          | Dagon5
          | RecipeNecronomicon
          | RecipeNecronomicon2
          | RecipeNecronomicon3
          | Necronomicon
          | Necronomicon2
          | Necronomicon3
          | RecipeAghanimsScepter
          | AghanimsScepter
          | RecipeRefresher
          | Refresher
          | RecipeAssault
          | Assault
          | RecipeHeart
          | Heart
          | RecipeBlackKingBar
          | BlackKingBar
          | Aegis
          | RecipeShivasGuard
          | ShivasGuard
          | RecipeBloodstone
          | Bloodstone
          | RecipeSphere
          | Sphere
          | RecipeVanguard
          | Vanguard
          | RecipeBladeMail
          | BladeMail
          | RecipeSoulBooster
          | SoulBooster
          | RecipeHoodOfDefiance
          | HoodOfDefiance
          | RecipeRapier
          | Rapier
          | RecipeMonkeyKingBar
          | MonkeyKingBar
          | RecipeRadiance
          | Radiance
          | RecipeButterfly
          | Butterfly
          | RecipeDaedalus
          | Daedalus
          | RecipeBasher
          | Basher
          | RecipeBattleFury
          | BattleFury
          | RecipeMantaStyle
          | MantaStyle
          | RecipeLesserCrit
          | LesserCrit
          | RecipeArmlet
          | Armlet
          | RecipeInvisSword
          | InvisSword
          | RecipeSangeAndYasha
          | SangeAndYasha
          | RecipeSatanic
          | Satanic
          | RecipeMjollnir
          | Mjollnir
          | RecipeSkadi
          | Skadi
          | RecipeSange
          | Sange
          | RecipeHelmOfTheDominator
          | HelmOfTheDominator
          | RecipeMaelstrom
          | Maelstrom
          | RecipeDesolator
          | Desolator
          | RecipeYasha
          | Yasha
          | RecipeMaskOfMadness
          | MaskOfMadness
          | RecipeDiffusalBlade
          | RecipeDiffusalBlade2
          | DiffusalBlade
          | DiffusalBlade2
          | RecipeEtherealBlade
          | EtherealBlade
          | RecipeSoulRing
          | SoulRing
          | RecipeArcaneBoots
          | ArcaneBoots
          | OrbOfVenom
          | RecipeDrumOfEndurance
          | DrumOfEndurance
          | RecipeMedallionOfCourage
          | MedallionOfCourage
          | SmokeOfDeceit
          | RecipeVeilOfDiscord
          | VeilOfDiscord
          | RecipeRodOfAtos
          | RodOfAtos
          | RecipeAbyssalBlade
          | AbyssalBlade
          | RecipeHeavensHalberd
          | HeavensHalberd
          | RecipeRingOfAquila
          | RingOfAquila
          | RecipeTranquilBoots
          | TranquilBoots
  deriving (Show, Eq)

itemFromID :: Integer -> Item
itemFromID 0 = NoItem
itemFromID 1 = BlinkDagger
itemFromID 2 = BladesOfAttack
itemFromID 3 = Broadsword
itemFromID 4 = Chainmail
itemFromID 5 = Claymore
itemFromID 6 = HelmOfIronWill
itemFromID 7 = Javelin
itemFromID 8 = MithrilHammer
itemFromID 9 = Platemail
itemFromID 10 = Quarterstaff
itemFromID 11 = QuellingBlade
itemFromID 12 = RingOfProtection
itemFromID 13 = GauntletsOfStrength
itemFromID 14 = SlippersOfAgility
itemFromID 15 = MantleOfIntelligence
itemFromID 16 = IronBranch
itemFromID 17 = BeltOfStrength
itemFromID 18 = BootsOfElveskin
itemFromID 19 = RobeOfTheMagi
itemFromID 20 = CircletOfNobelty
itemFromID 21 = OgreClub
itemFromID 22 = BladeOfAlacrity
itemFromID 23 = StaffOfWizardry
itemFromID 24 = UltimateOrb
itemFromID 25 = GlovesOfHaste
itemFromID 26 = MorbidMask
itemFromID 27 = RingOfRegen
itemFromID 28 = SagesMask
itemFromID 29 = BootsOfSpeed
itemFromID 30 = GemOfTrueSight
itemFromID 31 = Cloak
itemFromID 32 = TalismanOfEvasion
itemFromID 33 = Cheese
itemFromID 34 = MagicStick
itemFromID 35 = RecipeMagicWand
itemFromID 36 = MagicWand
itemFromID 37 = GhostScepter
itemFromID 38 = Clarity
itemFromID 39 = Flask
itemFromID 40 = Dust
itemFromID 41 = Bottle
itemFromID 42 = ObserverWard
itemFromID 43 = SentryWard
itemFromID 44 = Tango
itemFromID 45 = AnimalCourier
itemFromID 46 = TownPortalScroll
itemFromID 47 = RecipeTravelBoots
itemFromID 48 = TravelBoots
itemFromID 49 = RecipePhaseBoots
itemFromID 50 = PhaseBoots
itemFromID 51 = DemonEdge
itemFromID 52 = Eagle
itemFromID 53 = Reaver
itemFromID 54 = Relic
itemFromID 55 = Hyperstone
itemFromID 56 = RingOfHealth
itemFromID 57 = VoidStone
itemFromID 58 = MysticStaff
itemFromID 59 = EnergyBooster
itemFromID 60 = PointBooster
itemFromID 61 = VitalityBooster
itemFromID 62 = RecipePowerTreads
itemFromID 63 = PowerTreads
itemFromID 64 = RecipeHandOfMidas
itemFromID 65 = HandOfMidas
itemFromID 66 = RecipeOblivionStaff
itemFromID 67 = OblivionStaff
itemFromID 68 = RecipePers
itemFromID 69 = Pers
itemFromID 70 = RecipePoorMansShield
itemFromID 71 = PoorMansShield
itemFromID 72 = RecipeBracer
itemFromID 73 = Bracer
itemFromID 74 = RecipeWraithBand
itemFromID 75 = WraithBand
itemFromID 76 = RecipeNullTalisman
itemFromID 77 = NullTalisman
itemFromID 78 = RecipeMekansm
itemFromID 79 = Mekansm
itemFromID 80 = RecipeVladmir
itemFromID 81 = Vladmir
itemFromID 84 = FlyingCourier
itemFromID 85 = RecipeBuckler
itemFromID 86 = Buckler
itemFromID 87 = RecipeRingOfBasilius
itemFromID 88 = RingOfBasilius
itemFromID 89 = RecipePipeOfInsight
itemFromID 90 = PipeOfInsight
itemFromID 91 = RecipeUrnOfShadows
itemFromID 92 = UrnOfShadows
itemFromID 93 = RecipeHeaddress
itemFromID 94 = Headdress
itemFromID 95 = RecipeScytheOfVyse
itemFromID 96 = ScytheOfVyse
itemFromID 97 = RecipeOrchid
itemFromID 98 = Orchid
itemFromID 99 = RecipeCyclone
itemFromID 100 = Cyclone
itemFromID 101 = RecipeForceStaff
itemFromID 102 = ForceStaff
itemFromID 103 = RecipeDagon
itemFromID 197 = RecipeDagon2
itemFromID 198 = RecipeDagon3
itemFromID 199 = RecipeDagon4
itemFromID 200 = RecipeDagon5
itemFromID 104 = Dagon
itemFromID 201 = Dagon2
itemFromID 202 = Dagon3
itemFromID 203 = Dagon4
itemFromID 204 = Dagon5
itemFromID 105 = RecipeNecronomicon
itemFromID 191 = RecipeNecronomicon2
itemFromID 192 = RecipeNecronomicon3
itemFromID 106 = Necronomicon
itemFromID 193 = Necronomicon2
itemFromID 194 = Necronomicon3
itemFromID 107 = RecipeAghanimsScepter
itemFromID 108 = AghanimsScepter
itemFromID 109 = RecipeRefresher
itemFromID 110 = Refresher
itemFromID 111 = RecipeAssault
itemFromID 112 = Assault
itemFromID 113 = RecipeHeart
itemFromID 114 = Heart
itemFromID 115 = RecipeBlackKingBar
itemFromID 116 = BlackKingBar
itemFromID 117 = Aegis
itemFromID 118 = RecipeShivasGuard
itemFromID 119 = ShivasGuard
itemFromID 120 = RecipeBloodstone
itemFromID 121 = Bloodstone
itemFromID 122 = RecipeSphere
itemFromID 123 = Sphere
itemFromID 124 = RecipeVanguard
itemFromID 125 = Vanguard
itemFromID 126 = RecipeBladeMail
itemFromID 127 = BladeMail
itemFromID 128 = RecipeSoulBooster
itemFromID 129 = SoulBooster
itemFromID 130 = RecipeHoodOfDefiance
itemFromID 131 = HoodOfDefiance
itemFromID 132 = RecipeRapier
itemFromID 133 = Rapier
itemFromID 134 = RecipeMonkeyKingBar
itemFromID 135 = MonkeyKingBar
itemFromID 136 = RecipeRadiance
itemFromID 137 = Radiance
itemFromID 138 = RecipeButterfly
itemFromID 139 = Butterfly
itemFromID 140 = RecipeDaedalus
itemFromID 141 = Daedalus
itemFromID 142 = RecipeBasher
itemFromID 143 = Basher
itemFromID 144 = RecipeBattleFury
itemFromID 145 = BattleFury
itemFromID 146 = RecipeMantaStyle
itemFromID 147 = MantaStyle
itemFromID 148 = RecipeLesserCrit
itemFromID 149 = LesserCrit
itemFromID 150 = RecipeArmlet
itemFromID 151 = Armlet
itemFromID 183 = RecipeInvisSword
itemFromID 152 = InvisSword
itemFromID 153 = RecipeSangeAndYasha
itemFromID 154 = SangeAndYasha
itemFromID 155 = RecipeSatanic
itemFromID 156 = Satanic
itemFromID 157 = RecipeMjollnir
itemFromID 158 = Mjollnir
itemFromID 159 = RecipeSkadi
itemFromID 160 = Skadi
itemFromID 161 = RecipeSange
itemFromID 162 = Sange
itemFromID 163 = RecipeHelmOfTheDominator
itemFromID 164 = HelmOfTheDominator
itemFromID 165 = RecipeMaelstrom
itemFromID 166 = Maelstrom
itemFromID 167 = RecipeDesolator
itemFromID 168 = Desolator
itemFromID 169 = RecipeYasha
itemFromID 170 = Yasha
itemFromID 171 = RecipeMaskOfMadness
itemFromID 172 = MaskOfMadness
itemFromID 173 = RecipeDiffusalBlade
itemFromID 195 = RecipeDiffusalBlade2
itemFromID 174 = DiffusalBlade
itemFromID 196 = DiffusalBlade2
itemFromID 175 = RecipeEtherealBlade
itemFromID 176 = EtherealBlade
itemFromID 177 = RecipeSoulRing
itemFromID 178 = SoulRing
itemFromID 179 = RecipeArcaneBoots
itemFromID 180 = ArcaneBoots
itemFromID 181 = OrbOfVenom
itemFromID 182 = StoutShield
itemFromID 184 = RecipeDrumOfEndurance
itemFromID 185 = DrumOfEndurance
itemFromID 186 = RecipeMedallionOfCourage
itemFromID 187 = MedallionOfCourage
itemFromID 188 = SmokeOfDeceit
itemFromID 189 = RecipeVeilOfDiscord
itemFromID 190 = VeilOfDiscord
itemFromID 205 = RecipeRodOfAtos
itemFromID 206 = RodOfAtos
itemFromID 207 = RecipeAbyssalBlade
itemFromID 208 = AbyssalBlade
itemFromID 209 = RecipeHeavensHalberd
itemFromID 210 = HeavensHalberd
itemFromID 211 = RecipeRingOfAquila
itemFromID 212 = RingOfAquila
itemFromID 213 = RecipeTranquilBoots
itemFromID 214 = TranquilBoots
itemFromID _ = UnknownItem

itemToID :: Item -> Integer
itemToID NoItem = 0
itemToID BlinkDagger = 1
itemToID BladesOfAttack = 2
itemToID Broadsword = 3
itemToID Chainmail = 4
itemToID Claymore = 5
itemToID HelmOfIronWill = 6
itemToID Javelin = 7
itemToID MithrilHammer = 8
itemToID Platemail = 9
itemToID Quarterstaff = 10
itemToID QuellingBlade = 11
itemToID RingOfProtection = 12
itemToID GauntletsOfStrength = 13
itemToID SlippersOfAgility = 14
itemToID MantleOfIntelligence = 15
itemToID IronBranch = 16
itemToID BeltOfStrength = 17
itemToID BootsOfElveskin = 18
itemToID RobeOfTheMagi = 19
itemToID CircletOfNobelty = 20
itemToID OgreClub = 21
itemToID BladeOfAlacrity = 22
itemToID StaffOfWizardry = 23
itemToID UltimateOrb = 24
itemToID GlovesOfHaste = 25
itemToID MorbidMask = 26
itemToID RingOfRegen = 27
itemToID SagesMask = 28
itemToID BootsOfSpeed = 29
itemToID GemOfTrueSight = 30
itemToID Cloak = 31
itemToID TalismanOfEvasion = 32
itemToID Cheese = 33
itemToID MagicStick = 34
itemToID RecipeMagicWand = 35
itemToID MagicWand = 36
itemToID GhostScepter = 37
itemToID Clarity = 38
itemToID Flask = 39
itemToID Dust = 40
itemToID Bottle = 41
itemToID ObserverWard = 42
itemToID SentryWard = 43
itemToID Tango = 44
itemToID AnimalCourier = 45
itemToID TownPortalScroll = 46
itemToID RecipeTravelBoots = 47
itemToID TravelBoots = 48
itemToID RecipePhaseBoots = 49
itemToID PhaseBoots = 50
itemToID DemonEdge = 51
itemToID Eagle = 52
itemToID Reaver = 53
itemToID Relic = 54
itemToID Hyperstone = 55
itemToID RingOfHealth = 56
itemToID VoidStone = 57
itemToID MysticStaff = 58
itemToID EnergyBooster = 59
itemToID PointBooster = 60
itemToID VitalityBooster = 61
itemToID RecipePowerTreads = 62
itemToID PowerTreads = 63
itemToID RecipeHandOfMidas = 64
itemToID HandOfMidas = 65
itemToID RecipeOblivionStaff = 66
itemToID OblivionStaff = 67
itemToID RecipePers = 68
itemToID Pers = 69
itemToID RecipePoorMansShield = 70
itemToID PoorMansShield = 71
itemToID RecipeBracer = 72
itemToID Bracer = 73
itemToID RecipeWraithBand = 74
itemToID WraithBand = 75
itemToID RecipeNullTalisman = 76
itemToID NullTalisman = 77
itemToID RecipeMekansm = 78
itemToID Mekansm = 79
itemToID RecipeVladmir = 80
itemToID Vladmir = 81
itemToID FlyingCourier = 84
itemToID RecipeBuckler = 85
itemToID Buckler = 86
itemToID RecipeRingOfBasilius = 87
itemToID RingOfBasilius = 88
itemToID RecipePipeOfInsight = 89
itemToID PipeOfInsight = 90
itemToID RecipeUrnOfShadows = 91
itemToID UrnOfShadows = 92
itemToID RecipeHeaddress = 93
itemToID Headdress = 94
itemToID RecipeScytheOfVyse = 95
itemToID ScytheOfVyse = 96
itemToID RecipeOrchid = 97
itemToID Orchid = 98
itemToID RecipeCyclone = 99
itemToID Cyclone = 100
itemToID RecipeForceStaff = 101
itemToID ForceStaff = 102
itemToID RecipeDagon = 103
itemToID RecipeDagon2 = 197
itemToID RecipeDagon3 = 198
itemToID RecipeDagon4 = 199
itemToID RecipeDagon5 = 200
itemToID Dagon = 104
itemToID Dagon2 = 201
itemToID Dagon3 = 202
itemToID Dagon4 = 203
itemToID Dagon5 = 204
itemToID RecipeNecronomicon = 105
itemToID RecipeNecronomicon2 = 191
itemToID RecipeNecronomicon3 = 192
itemToID Necronomicon = 106
itemToID Necronomicon2 = 193
itemToID Necronomicon3 = 194
itemToID RecipeAghanimsScepter = 107
itemToID AghanimsScepter = 108
itemToID RecipeRefresher = 109
itemToID Refresher = 110
itemToID RecipeAssault = 111
itemToID Assault = 112
itemToID RecipeHeart = 113
itemToID Heart = 114
itemToID RecipeBlackKingBar = 115
itemToID BlackKingBar = 116
itemToID Aegis = 117
itemToID RecipeShivasGuard = 118
itemToID ShivasGuard = 119
itemToID RecipeBloodstone = 120
itemToID Bloodstone = 121
itemToID RecipeSphere = 122
itemToID Sphere = 123
itemToID RecipeVanguard = 124
itemToID Vanguard = 125
itemToID RecipeBladeMail = 126
itemToID BladeMail = 127
itemToID RecipeSoulBooster = 128
itemToID SoulBooster = 129
itemToID RecipeHoodOfDefiance = 130
itemToID HoodOfDefiance = 131
itemToID RecipeRapier = 132
itemToID Rapier = 133
itemToID RecipeMonkeyKingBar = 134
itemToID MonkeyKingBar = 135
itemToID RecipeRadiance = 136
itemToID Radiance = 137
itemToID RecipeButterfly = 138
itemToID Butterfly = 139
itemToID RecipeDaedalus = 140
itemToID Daedalus = 141
itemToID RecipeBasher = 142
itemToID Basher = 143
itemToID RecipeBattleFury = 144
itemToID BattleFury = 145
itemToID RecipeMantaStyle = 146
itemToID MantaStyle = 147
itemToID RecipeLesserCrit = 148
itemToID LesserCrit = 149
itemToID RecipeArmlet = 150
itemToID Armlet = 151
itemToID RecipeInvisSword = 183
itemToID InvisSword = 152
itemToID RecipeSangeAndYasha = 153
itemToID SangeAndYasha = 154
itemToID RecipeSatanic = 155
itemToID Satanic = 156
itemToID RecipeMjollnir = 157
itemToID Mjollnir = 158
itemToID RecipeSkadi = 159
itemToID Skadi = 160
itemToID RecipeSange = 161
itemToID Sange = 162
itemToID RecipeHelmOfTheDominator = 163
itemToID HelmOfTheDominator = 164
itemToID RecipeMaelstrom = 165
itemToID Maelstrom = 166
itemToID RecipeDesolator = 167
itemToID Desolator = 168
itemToID RecipeYasha = 169
itemToID Yasha = 170
itemToID RecipeMaskOfMadness = 171
itemToID MaskOfMadness = 172
itemToID RecipeDiffusalBlade = 173
itemToID RecipeDiffusalBlade2 = 195
itemToID DiffusalBlade = 174
itemToID DiffusalBlade2 = 196
itemToID RecipeEtherealBlade = 175
itemToID EtherealBlade = 176
itemToID RecipeSoulRing = 177
itemToID SoulRing = 178
itemToID RecipeArcaneBoots = 179
itemToID ArcaneBoots = 180
itemToID OrbOfVenom = 181
itemToID StoutShield = 182
itemToID RecipeDrumOfEndurance = 184
itemToID DrumOfEndurance = 185
itemToID RecipeMedallionOfCourage = 186
itemToID MedallionOfCourage = 187
itemToID SmokeOfDeceit = 188
itemToID RecipeVeilOfDiscord = 189
itemToID VeilOfDiscord = 190
itemToID RecipeRodOfAtos = 205
itemToID RodOfAtos = 206
itemToID RecipeAbyssalBlade = 207
itemToID AbyssalBlade = 208
itemToID RecipeHeavensHalberd = 209
itemToID HeavensHalberd = 210
itemToID RecipeRingOfAquila = 211
itemToID RingOfAquila = 212
itemToID RecipeTranquilBoots = 213
itemToID TranquilBoots = 214
itemToID UnknownItem = -1
