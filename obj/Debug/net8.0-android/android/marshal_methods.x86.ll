; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [319 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [632 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 239
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 273
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 38948123, ; 6: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 281
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42244203, ; 8: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 290
	i32 42639949, ; 9: System.Threading.Thread => 0x28aa24d => 145
	i32 65960268, ; 10: Microsoft.Win32.SystemEvents.dll => 0x3ee794c => 192
	i32 66541672, ; 11: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 12: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 314
	i32 68219467, ; 13: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 14: Microsoft.Maui.Graphics.dll => 0x44bb714 => 191
	i32 82292897, ; 15: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83839681, ; 16: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 298
	i32 101534019, ; 17: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 257
	i32 117431740, ; 18: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 19: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 257
	i32 122350210, ; 20: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 21: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 277
	i32 136584136, ; 22: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 313
	i32 140062828, ; 23: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 306
	i32 142721839, ; 24: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 25: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 26: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 27: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 213
	i32 176265551, ; 28: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 29: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 259
	i32 184328833, ; 30: System.ValueTuple.dll => 0xafca281 => 151
	i32 205061960, ; 31: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 32: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 211
	i32 220171995, ; 33: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 34: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 233
	i32 230752869, ; 35: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 36: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 37: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 38: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 39: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 216
	i32 276479776, ; 40: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 41: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 235
	i32 280482487, ; 42: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 232
	i32 291076382, ; 43: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 44: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 45: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 311
	i32 318968648, ; 46: Xamarin.AndroidX.Activity.dll => 0x13031348 => 202
	i32 321597661, ; 47: System.Numerics => 0x132b30dd => 83
	i32 321963286, ; 48: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 289
	i32 342366114, ; 49: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 234
	i32 360082299, ; 50: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 51: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 52: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 53: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 54: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 55: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 56: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 57: _Microsoft.Android.Resource.Designer => 0x17969339 => 315
	i32 403441872, ; 58: WindowsBase => 0x180c08d0 => 165
	i32 409257351, ; 59: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 309
	i32 441335492, ; 60: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 217
	i32 442565967, ; 61: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 62: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 230
	i32 451504562, ; 63: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 64: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 65: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 66: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 67: System.dll => 0x1bff388e => 164
	i32 476646585, ; 68: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 232
	i32 486930444, ; 69: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 245
	i32 489220957, ; 70: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 287
	i32 498788369, ; 71: System.ObjectModel => 0x1dbae811 => 84
	i32 513247710, ; 72: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 185
	i32 526420162, ; 73: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 74: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 277
	i32 530272170, ; 75: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 538707440, ; 76: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 308
	i32 539058512, ; 77: Microsoft.Extensions.Logging => 0x20216150 => 181
	i32 540030774, ; 78: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 79: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 80: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 81: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 82: Jsr305Binding => 0x213954e7 => 270
	i32 569601784, ; 83: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 268
	i32 577335427, ; 84: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 597488923, ; 85: CommunityToolkit.Maui => 0x239cf51b => 173
	i32 600029185, ; 86: ConvertFile => 0x23c3b801 => 0
	i32 601371474, ; 87: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 88: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 89: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 90: Xamarin.AndroidX.CustomView => 0x2568904f => 222
	i32 627931235, ; 91: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 300
	i32 639843206, ; 92: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 228
	i32 643868501, ; 93: System.Net => 0x2660a755 => 81
	i32 662205335, ; 94: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 95: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 264
	i32 666292255, ; 96: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 209
	i32 672442732, ; 97: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 98: System.Net.Security => 0x28bdabca => 73
	i32 690569205, ; 99: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 100: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 279
	i32 693804605, ; 101: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 102: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 103: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 274
	i32 700358131, ; 104: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 720511267, ; 105: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 278
	i32 722857257, ; 106: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 107: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 108: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 109: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 199
	i32 759454413, ; 110: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 111: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 112: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 113: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 306
	i32 789151979, ; 114: Microsoft.Extensions.Options => 0x2f0980eb => 184
	i32 790371945, ; 115: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 223
	i32 804715423, ; 116: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 117: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 237
	i32 809851609, ; 118: System.Drawing.Common.dll => 0x30455ad9 => 196
	i32 823281589, ; 119: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 120: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 121: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 122: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 123: Xamarin.AndroidX.Print => 0x3246f6cd => 250
	i32 869139383, ; 124: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 291
	i32 873119928, ; 125: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 126: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 127: System.Net.Http.Json => 0x3463c971 => 63
	i32 880668424, ; 128: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 305
	i32 904024072, ; 129: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 130: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 918734561, ; 131: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 302
	i32 928116545, ; 132: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 273
	i32 952186615, ; 133: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 134: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 278
	i32 961460050, ; 135: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 295
	i32 966729478, ; 136: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 271
	i32 967690846, ; 137: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 234
	i32 975236339, ; 138: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 139: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 140: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 141: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 990727110, ; 142: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 304
	i32 992768348, ; 143: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 144: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 145: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 146: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 254
	i32 1019214401, ; 147: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 148: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 180
	i32 1031528504, ; 149: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 272
	i32 1035644815, ; 150: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 207
	i32 1036536393, ; 151: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1043950537, ; 152: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 285
	i32 1044663988, ; 153: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 154: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 241
	i32 1067306892, ; 155: GoogleGson => 0x3f9dcf8c => 176
	i32 1082857460, ; 156: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 157: Xamarin.Kotlin.StdLib => 0x409e66d8 => 275
	i32 1089913930, ; 158: System.Diagnostics.EventLog.dll => 0x40f6c44a => 194
	i32 1098259244, ; 159: System => 0x41761b2c => 164
	i32 1108272742, ; 160: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 307
	i32 1117529484, ; 161: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 301
	i32 1118262833, ; 162: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 297
	i32 1121599056, ; 163: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 240
	i32 1127624469, ; 164: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 183
	i32 1149092582, ; 165: Xamarin.AndroidX.Window => 0x447dc2e6 => 267
	i32 1168523401, ; 166: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 303
	i32 1170634674, ; 167: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 168: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 263
	i32 1178241025, ; 169: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 248
	i32 1204270330, ; 170: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 209
	i32 1208641965, ; 171: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1214827643, ; 172: CommunityToolkit.Mvvm => 0x4868cc7b => 175
	i32 1219128291, ; 173: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1243150071, ; 174: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 268
	i32 1253011324, ; 175: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 176: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 283
	i32 1264511973, ; 177: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 258
	i32 1267360935, ; 178: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 262
	i32 1273260888, ; 179: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 214
	i32 1275534314, ; 180: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 279
	i32 1278448581, ; 181: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 206
	i32 1293217323, ; 182: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 225
	i32 1308624726, ; 183: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 292
	i32 1309188875, ; 184: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 185: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 267
	i32 1324164729, ; 186: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 187: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1336711579, ; 188: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 312
	i32 1351692320, ; 189: System.Diagnostics.PerformanceCounter.dll => 0x50913020 => 195
	i32 1364015309, ; 190: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 191: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 313
	i32 1376866003, ; 192: Xamarin.AndroidX.SavedState => 0x52114ed3 => 254
	i32 1379779777, ; 193: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 194: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 195: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 218
	i32 1408764838, ; 196: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 197: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 198: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 199: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 281
	i32 1434145427, ; 200: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 201: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 271
	i32 1439761251, ; 202: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 203: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 204: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 205: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 206: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 207: es\Microsoft.Maui.Controls.resources => 0x57152abe => 287
	i32 1461234159, ; 208: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 209: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 210: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 211: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 208
	i32 1470490898, ; 212: Microsoft.Extensions.Primitives => 0x57a5e912 => 185
	i32 1479771757, ; 213: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 214: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 215: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 216: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 255
	i32 1526286932, ; 217: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 311
	i32 1536373174, ; 218: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 219: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 220: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 221: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1565862583, ; 222: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 223: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 224: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 225: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 226: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 224
	i32 1592978981, ; 227: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 228: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 272
	i32 1601112923, ; 229: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 230: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 231: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 232: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 244
	i32 1622358360, ; 233: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 234: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 266
	i32 1634654947, ; 235: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 174
	i32 1635184631, ; 236: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 228
	i32 1636350590, ; 237: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 221
	i32 1639515021, ; 238: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 239: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 240: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 241: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 242: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 260
	i32 1658251792, ; 243: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 269
	i32 1670060433, ; 244: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 216
	i32 1675553242, ; 245: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 246: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 247: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 248: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 249: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 250: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 251: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 276
	i32 1701541528, ; 252: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 253: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 237
	i32 1726116996, ; 254: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 255: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 256: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 212
	i32 1743415430, ; 257: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 282
	i32 1744735666, ; 258: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 259: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 260: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 261: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 262: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 263: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 264: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 259
	i32 1770582343, ; 265: Microsoft.Extensions.Logging.dll => 0x6988f147 => 181
	i32 1776026572, ; 266: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 267: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 268: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 269: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 298
	i32 1788241197, ; 270: Xamarin.AndroidX.Fragment => 0x6a96652d => 230
	i32 1793755602, ; 271: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 290
	i32 1808609942, ; 272: Xamarin.AndroidX.Loader => 0x6bcd3296 => 244
	i32 1813058853, ; 273: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 275
	i32 1813201214, ; 274: Xamarin.Google.Android.Material => 0x6c13413e => 269
	i32 1818569960, ; 275: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 249
	i32 1818787751, ; 276: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 277: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 278: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 279: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 182
	i32 1847515442, ; 280: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 199
	i32 1853025655, ; 281: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 307
	i32 1858542181, ; 282: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 283: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 284: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 289
	i32 1879696579, ; 285: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 286: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 210
	i32 1888955245, ; 287: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 288: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1892063920, ; 289: System.Diagnostics.PerformanceCounter => 0x70c69ab0 => 195
	i32 1893218855, ; 290: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 283
	i32 1898237753, ; 291: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 292: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 293: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 294: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953182387, ; 295: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 294
	i32 1956758971, ; 296: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 297: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 256
	i32 1968388702, ; 298: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 177
	i32 1983156543, ; 299: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 276
	i32 1985761444, ; 300: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 201
	i32 2003115576, ; 301: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 286
	i32 2011961780, ; 302: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 303: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 241
	i32 2031763787, ; 304: Xamarin.Android.Glide => 0x791a414b => 198
	i32 2045470958, ; 305: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 306: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 236
	i32 2060060697, ; 307: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 308: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 285
	i32 2070888862, ; 309: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 310: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 311: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 312: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 313: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 314: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 315: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 316: Microsoft.Maui => 0x80bd55ad => 189
	i32 2169148018, ; 317: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 293
	i32 2181898931, ; 318: Microsoft.Extensions.Options.dll => 0x820d22b3 => 184
	i32 2192057212, ; 319: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 182
	i32 2193016926, ; 320: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 321: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 280
	i32 2201231467, ; 322: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 323: it\Microsoft.Maui.Controls.resources => 0x839595db => 295
	i32 2217644978, ; 324: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 263
	i32 2222056684, ; 325: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 326: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 245
	i32 2252106437, ; 327: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 328: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 329: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 330: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 178
	i32 2267999099, ; 331: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 200
	i32 2279755925, ; 332: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 252
	i32 2293034957, ; 333: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 334: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 335: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 336: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 299
	i32 2305521784, ; 337: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 338: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 204
	i32 2320631194, ; 339: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 340: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 341: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 342: System.Net.Primitives => 0x8c40e0db => 70
	i32 2366048013, ; 343: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 293
	i32 2368005991, ; 344: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 345: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 177
	i32 2378619854, ; 346: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 347: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 348: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 294
	i32 2401565422, ; 349: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 350: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 227
	i32 2421380589, ; 351: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 352: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 214
	i32 2427813419, ; 353: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 291
	i32 2435356389, ; 354: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 355: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 356: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 357: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 358: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 359: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 217
	i32 2471841756, ; 360: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 361: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 362: Microsoft.Maui.Controls => 0x93dba8a1 => 187
	i32 2483903535, ; 363: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 364: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 365: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 366: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 367: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 297
	i32 2505896520, ; 368: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 239
	i32 2509217888, ; 369: System.Diagnostics.EventLog => 0x958fa060 => 194
	i32 2522472828, ; 370: Xamarin.Android.Glide.dll => 0x9659e17c => 198
	i32 2538310050, ; 371: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 372: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 292
	i32 2562349572, ; 373: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 374: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2576534780, ; 375: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 296
	i32 2581783588, ; 376: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 240
	i32 2581819634, ; 377: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 262
	i32 2585220780, ; 378: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 379: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 380: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 381: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 301
	i32 2605712449, ; 382: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 280
	i32 2615233544, ; 383: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 231
	i32 2616218305, ; 384: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 183
	i32 2617129537, ; 385: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 386: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 387: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 221
	i32 2624644809, ; 388: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 226
	i32 2626831493, ; 389: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 296
	i32 2627185994, ; 390: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 391: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 392: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 235
	i32 2660759594, ; 393: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 197
	i32 2663391936, ; 394: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 200
	i32 2663698177, ; 395: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 396: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 397: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 398: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 399: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 400: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 401: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 260
	i32 2715334215, ; 402: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 403: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 404: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 405: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 406: Xamarin.AndroidX.Activity => 0xa2e0939b => 202
	i32 2735172069, ; 407: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 408: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 208
	i32 2740698338, ; 409: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 282
	i32 2740948882, ; 410: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 411: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 412: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 302
	i32 2758225723, ; 413: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 188
	i32 2764765095, ; 414: Microsoft.Maui.dll => 0xa4caf7a7 => 189
	i32 2765824710, ; 415: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 416: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 274
	i32 2778768386, ; 417: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 265
	i32 2779977773, ; 418: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 253
	i32 2785988530, ; 419: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 308
	i32 2788224221, ; 420: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 231
	i32 2795666278, ; 421: Microsoft.Win32.SystemEvents => 0xa6a27b66 => 192
	i32 2801831435, ; 422: Microsoft.Maui.Graphics => 0xa7008e0b => 191
	i32 2803228030, ; 423: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2810250172, ; 424: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 218
	i32 2819470561, ; 425: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 426: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 427: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 253
	i32 2824502124, ; 428: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2838993487, ; 429: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 242
	i32 2849599387, ; 430: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 431: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 265
	i32 2855708567, ; 432: Xamarin.AndroidX.Transition => 0xaa36a797 => 261
	i32 2861098320, ; 433: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 434: Microsoft.Maui.Essentials => 0xaa8a4878 => 190
	i32 2867946736, ; 435: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 197
	i32 2868488919, ; 436: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 174
	i32 2870099610, ; 437: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 203
	i32 2875164099, ; 438: Jsr305Binding.dll => 0xab5f85c3 => 270
	i32 2875220617, ; 439: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 440: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 229
	i32 2887636118, ; 441: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 442: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 443: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 444: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 445: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 446: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 447: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 266
	i32 2919462931, ; 448: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 449: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 205
	i32 2936416060, ; 450: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 451: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 452: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2944313911, ; 453: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 193
	i32 2959614098, ; 454: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 455: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 456: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 457: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 225
	i32 2987532451, ; 458: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 256
	i32 2996846495, ; 459: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 238
	i32 3012788804, ; 460: System.Configuration.ConfigurationManager => 0xb3938244 => 193
	i32 3016983068, ; 461: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 258
	i32 3023353419, ; 462: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 463: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 233
	i32 3038032645, ; 464: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 315
	i32 3053864966, ; 465: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 288
	i32 3056245963, ; 466: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 255
	i32 3057625584, ; 467: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 246
	i32 3059408633, ; 468: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 469: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 470: System.Threading.Tasks => 0xb755818f => 144
	i32 3090735792, ; 471: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 472: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 473: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 474: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 475: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 476: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 477: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 478: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 479: GoogleGson.dll => 0xbba64c02 => 176
	i32 3159123045, ; 480: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 481: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 482: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 247
	i32 3192346100, ; 483: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 484: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 485: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 486: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 487: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 224
	i32 3220365878, ; 488: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 489: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 490: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 491: Xamarin.AndroidX.CardView => 0xc235e84d => 212
	i32 3265493905, ; 492: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 493: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 494: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 495: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 496: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 497: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 498: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 499: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 500: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 288
	i32 3316684772, ; 501: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 502: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 222
	i32 3317144872, ; 503: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 504: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 210
	i32 3345895724, ; 505: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 251
	i32 3346324047, ; 506: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 248
	i32 3357674450, ; 507: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 305
	i32 3358260929, ; 508: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 509: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 203
	i32 3362522851, ; 510: Xamarin.AndroidX.Core => 0xc86c06e3 => 219
	i32 3366347497, ; 511: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 512: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 252
	i32 3381016424, ; 513: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 284
	i32 3395150330, ; 514: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 515: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 516: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 223
	i32 3428513518, ; 517: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 179
	i32 3429136800, ; 518: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 519: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 520: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 226
	i32 3445260447, ; 521: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 522: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 186
	i32 3458724246, ; 523: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 303
	i32 3471940407, ; 524: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 525: Mono.Android => 0xcf3163e6 => 171
	i32 3484440000, ; 526: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 304
	i32 3485117614, ; 527: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 528: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 529: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 215
	i32 3509114376, ; 530: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 531: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 532: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 533: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 534: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 535: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 536: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 312
	i32 3592228221, ; 537: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 314
	i32 3597029428, ; 538: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 201
	i32 3598340787, ; 539: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 540: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 541: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 542: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 250
	i32 3633644679, ; 543: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 205
	i32 3638274909, ; 544: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 545: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 236
	i32 3643446276, ; 546: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 309
	i32 3643854240, ; 547: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 247
	i32 3645089577, ; 548: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 549: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 178
	i32 3660523487, ; 550: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 551: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 552: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 211
	i32 3684561358, ; 553: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 215
	i32 3689375977, ; 554: System.Drawing.Common => 0xdbe768e9 => 196
	i32 3700866549, ; 555: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 556: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 220
	i32 3716563718, ; 557: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 558: Xamarin.AndroidX.Annotation => 0xdda814c6 => 204
	i32 3724971120, ; 559: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 246
	i32 3732100267, ; 560: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 561: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 562: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 563: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3751619990, ; 564: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 284
	i32 3786282454, ; 565: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 213
	i32 3792276235, ; 566: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 567: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 186
	i32 3802395368, ; 568: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 569: CommunityToolkit.Maui.dll => 0xe3886bf7 => 173
	i32 3819260425, ; 570: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 571: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 572: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 573: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 180
	i32 3844307129, ; 574: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 575: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 576: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 577: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 578: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 579: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 580: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 261
	i32 3888767677, ; 581: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 251
	i32 3896106733, ; 582: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 583: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 219
	i32 3901907137, ; 584: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920221145, ; 585: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 300
	i32 3920810846, ; 586: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 587: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 264
	i32 3928044579, ; 588: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 589: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 590: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 249
	i32 3945713374, ; 591: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 592: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 593: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 207
	i32 3959773229, ; 594: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 238
	i32 4003436829, ; 595: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 596: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 206
	i32 4025784931, ; 597: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 598: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 188
	i32 4054681211, ; 599: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 600: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 601: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4091086043, ; 602: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 286
	i32 4094352644, ; 603: Microsoft.Maui.Essentials.dll => 0xf40add04 => 190
	i32 4099507663, ; 604: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 605: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 606: Xamarin.AndroidX.Emoji2 => 0xf479582c => 227
	i32 4103439459, ; 607: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 310
	i32 4126470640, ; 608: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 179
	i32 4127667938, ; 609: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 610: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 611: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 612: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 310
	i32 4151237749, ; 613: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 614: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 615: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 616: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 617: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 618: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 243
	i32 4185676441, ; 619: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 620: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 621: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4249188766, ; 622: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 299
	i32 4254473836, ; 623: ConvertFile.dll => 0xfd961e6c => 0
	i32 4256097574, ; 624: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 220
	i32 4258378803, ; 625: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 242
	i32 4260525087, ; 626: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 627: Microsoft.Maui.Controls.dll => 0xfea12dee => 187
	i32 4274623895, ; 628: CommunityToolkit.Mvvm.dll => 0xfec99597 => 175
	i32 4274976490, ; 629: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 630: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 243
	i32 4294763496 ; 631: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 229
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [632 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 239, ; 3
	i32 273, ; 4
	i32 48, ; 5
	i32 281, ; 6
	i32 80, ; 7
	i32 290, ; 8
	i32 145, ; 9
	i32 192, ; 10
	i32 30, ; 11
	i32 314, ; 12
	i32 124, ; 13
	i32 191, ; 14
	i32 102, ; 15
	i32 298, ; 16
	i32 257, ; 17
	i32 107, ; 18
	i32 257, ; 19
	i32 139, ; 20
	i32 277, ; 21
	i32 313, ; 22
	i32 306, ; 23
	i32 77, ; 24
	i32 124, ; 25
	i32 13, ; 26
	i32 213, ; 27
	i32 132, ; 28
	i32 259, ; 29
	i32 151, ; 30
	i32 18, ; 31
	i32 211, ; 32
	i32 26, ; 33
	i32 233, ; 34
	i32 1, ; 35
	i32 59, ; 36
	i32 42, ; 37
	i32 91, ; 38
	i32 216, ; 39
	i32 147, ; 40
	i32 235, ; 41
	i32 232, ; 42
	i32 54, ; 43
	i32 69, ; 44
	i32 311, ; 45
	i32 202, ; 46
	i32 83, ; 47
	i32 289, ; 48
	i32 234, ; 49
	i32 131, ; 50
	i32 55, ; 51
	i32 149, ; 52
	i32 74, ; 53
	i32 145, ; 54
	i32 62, ; 55
	i32 146, ; 56
	i32 315, ; 57
	i32 165, ; 58
	i32 309, ; 59
	i32 217, ; 60
	i32 12, ; 61
	i32 230, ; 62
	i32 125, ; 63
	i32 152, ; 64
	i32 113, ; 65
	i32 166, ; 66
	i32 164, ; 67
	i32 232, ; 68
	i32 245, ; 69
	i32 287, ; 70
	i32 84, ; 71
	i32 185, ; 72
	i32 150, ; 73
	i32 277, ; 74
	i32 60, ; 75
	i32 308, ; 76
	i32 181, ; 77
	i32 51, ; 78
	i32 103, ; 79
	i32 114, ; 80
	i32 40, ; 81
	i32 270, ; 82
	i32 268, ; 83
	i32 120, ; 84
	i32 173, ; 85
	i32 0, ; 86
	i32 52, ; 87
	i32 44, ; 88
	i32 119, ; 89
	i32 222, ; 90
	i32 300, ; 91
	i32 228, ; 92
	i32 81, ; 93
	i32 136, ; 94
	i32 264, ; 95
	i32 209, ; 96
	i32 8, ; 97
	i32 73, ; 98
	i32 155, ; 99
	i32 279, ; 100
	i32 154, ; 101
	i32 92, ; 102
	i32 274, ; 103
	i32 45, ; 104
	i32 278, ; 105
	i32 109, ; 106
	i32 129, ; 107
	i32 25, ; 108
	i32 199, ; 109
	i32 72, ; 110
	i32 55, ; 111
	i32 46, ; 112
	i32 306, ; 113
	i32 184, ; 114
	i32 223, ; 115
	i32 22, ; 116
	i32 237, ; 117
	i32 196, ; 118
	i32 86, ; 119
	i32 43, ; 120
	i32 160, ; 121
	i32 71, ; 122
	i32 250, ; 123
	i32 291, ; 124
	i32 3, ; 125
	i32 42, ; 126
	i32 63, ; 127
	i32 305, ; 128
	i32 16, ; 129
	i32 53, ; 130
	i32 302, ; 131
	i32 273, ; 132
	i32 105, ; 133
	i32 278, ; 134
	i32 295, ; 135
	i32 271, ; 136
	i32 234, ; 137
	i32 34, ; 138
	i32 158, ; 139
	i32 85, ; 140
	i32 32, ; 141
	i32 304, ; 142
	i32 12, ; 143
	i32 51, ; 144
	i32 56, ; 145
	i32 254, ; 146
	i32 36, ; 147
	i32 180, ; 148
	i32 272, ; 149
	i32 207, ; 150
	i32 35, ; 151
	i32 285, ; 152
	i32 58, ; 153
	i32 241, ; 154
	i32 176, ; 155
	i32 17, ; 156
	i32 275, ; 157
	i32 194, ; 158
	i32 164, ; 159
	i32 307, ; 160
	i32 301, ; 161
	i32 297, ; 162
	i32 240, ; 163
	i32 183, ; 164
	i32 267, ; 165
	i32 303, ; 166
	i32 153, ; 167
	i32 263, ; 168
	i32 248, ; 169
	i32 209, ; 170
	i32 29, ; 171
	i32 175, ; 172
	i32 52, ; 173
	i32 268, ; 174
	i32 5, ; 175
	i32 283, ; 176
	i32 258, ; 177
	i32 262, ; 178
	i32 214, ; 179
	i32 279, ; 180
	i32 206, ; 181
	i32 225, ; 182
	i32 292, ; 183
	i32 85, ; 184
	i32 267, ; 185
	i32 61, ; 186
	i32 112, ; 187
	i32 312, ; 188
	i32 195, ; 189
	i32 57, ; 190
	i32 313, ; 191
	i32 254, ; 192
	i32 99, ; 193
	i32 19, ; 194
	i32 218, ; 195
	i32 111, ; 196
	i32 101, ; 197
	i32 102, ; 198
	i32 281, ; 199
	i32 104, ; 200
	i32 271, ; 201
	i32 71, ; 202
	i32 38, ; 203
	i32 32, ; 204
	i32 103, ; 205
	i32 73, ; 206
	i32 287, ; 207
	i32 9, ; 208
	i32 123, ; 209
	i32 46, ; 210
	i32 208, ; 211
	i32 185, ; 212
	i32 9, ; 213
	i32 43, ; 214
	i32 4, ; 215
	i32 255, ; 216
	i32 311, ; 217
	i32 31, ; 218
	i32 138, ; 219
	i32 92, ; 220
	i32 93, ; 221
	i32 49, ; 222
	i32 141, ; 223
	i32 112, ; 224
	i32 140, ; 225
	i32 224, ; 226
	i32 115, ; 227
	i32 272, ; 228
	i32 157, ; 229
	i32 76, ; 230
	i32 79, ; 231
	i32 244, ; 232
	i32 37, ; 233
	i32 266, ; 234
	i32 174, ; 235
	i32 228, ; 236
	i32 221, ; 237
	i32 64, ; 238
	i32 138, ; 239
	i32 15, ; 240
	i32 116, ; 241
	i32 260, ; 242
	i32 269, ; 243
	i32 216, ; 244
	i32 48, ; 245
	i32 70, ; 246
	i32 80, ; 247
	i32 126, ; 248
	i32 94, ; 249
	i32 121, ; 250
	i32 276, ; 251
	i32 26, ; 252
	i32 237, ; 253
	i32 97, ; 254
	i32 28, ; 255
	i32 212, ; 256
	i32 282, ; 257
	i32 149, ; 258
	i32 169, ; 259
	i32 4, ; 260
	i32 98, ; 261
	i32 33, ; 262
	i32 93, ; 263
	i32 259, ; 264
	i32 181, ; 265
	i32 21, ; 266
	i32 41, ; 267
	i32 170, ; 268
	i32 298, ; 269
	i32 230, ; 270
	i32 290, ; 271
	i32 244, ; 272
	i32 275, ; 273
	i32 269, ; 274
	i32 249, ; 275
	i32 2, ; 276
	i32 134, ; 277
	i32 111, ; 278
	i32 182, ; 279
	i32 199, ; 280
	i32 307, ; 281
	i32 58, ; 282
	i32 95, ; 283
	i32 289, ; 284
	i32 39, ; 285
	i32 210, ; 286
	i32 25, ; 287
	i32 94, ; 288
	i32 195, ; 289
	i32 283, ; 290
	i32 89, ; 291
	i32 99, ; 292
	i32 10, ; 293
	i32 87, ; 294
	i32 294, ; 295
	i32 100, ; 296
	i32 256, ; 297
	i32 177, ; 298
	i32 276, ; 299
	i32 201, ; 300
	i32 286, ; 301
	i32 7, ; 302
	i32 241, ; 303
	i32 198, ; 304
	i32 88, ; 305
	i32 236, ; 306
	i32 154, ; 307
	i32 285, ; 308
	i32 33, ; 309
	i32 116, ; 310
	i32 82, ; 311
	i32 20, ; 312
	i32 11, ; 313
	i32 162, ; 314
	i32 3, ; 315
	i32 189, ; 316
	i32 293, ; 317
	i32 184, ; 318
	i32 182, ; 319
	i32 84, ; 320
	i32 280, ; 321
	i32 64, ; 322
	i32 295, ; 323
	i32 263, ; 324
	i32 143, ; 325
	i32 245, ; 326
	i32 157, ; 327
	i32 41, ; 328
	i32 117, ; 329
	i32 178, ; 330
	i32 200, ; 331
	i32 252, ; 332
	i32 131, ; 333
	i32 75, ; 334
	i32 66, ; 335
	i32 299, ; 336
	i32 172, ; 337
	i32 204, ; 338
	i32 143, ; 339
	i32 106, ; 340
	i32 151, ; 341
	i32 70, ; 342
	i32 293, ; 343
	i32 156, ; 344
	i32 177, ; 345
	i32 121, ; 346
	i32 127, ; 347
	i32 294, ; 348
	i32 152, ; 349
	i32 227, ; 350
	i32 141, ; 351
	i32 214, ; 352
	i32 291, ; 353
	i32 20, ; 354
	i32 14, ; 355
	i32 135, ; 356
	i32 75, ; 357
	i32 59, ; 358
	i32 217, ; 359
	i32 167, ; 360
	i32 168, ; 361
	i32 187, ; 362
	i32 15, ; 363
	i32 74, ; 364
	i32 6, ; 365
	i32 23, ; 366
	i32 297, ; 367
	i32 239, ; 368
	i32 194, ; 369
	i32 198, ; 370
	i32 91, ; 371
	i32 292, ; 372
	i32 1, ; 373
	i32 136, ; 374
	i32 296, ; 375
	i32 240, ; 376
	i32 262, ; 377
	i32 134, ; 378
	i32 69, ; 379
	i32 146, ; 380
	i32 301, ; 381
	i32 280, ; 382
	i32 231, ; 383
	i32 183, ; 384
	i32 88, ; 385
	i32 96, ; 386
	i32 221, ; 387
	i32 226, ; 388
	i32 296, ; 389
	i32 31, ; 390
	i32 45, ; 391
	i32 235, ; 392
	i32 197, ; 393
	i32 200, ; 394
	i32 109, ; 395
	i32 158, ; 396
	i32 35, ; 397
	i32 22, ; 398
	i32 114, ; 399
	i32 57, ; 400
	i32 260, ; 401
	i32 144, ; 402
	i32 118, ; 403
	i32 120, ; 404
	i32 110, ; 405
	i32 202, ; 406
	i32 139, ; 407
	i32 208, ; 408
	i32 282, ; 409
	i32 54, ; 410
	i32 105, ; 411
	i32 302, ; 412
	i32 188, ; 413
	i32 189, ; 414
	i32 133, ; 415
	i32 274, ; 416
	i32 265, ; 417
	i32 253, ; 418
	i32 308, ; 419
	i32 231, ; 420
	i32 192, ; 421
	i32 191, ; 422
	i32 159, ; 423
	i32 218, ; 424
	i32 163, ; 425
	i32 132, ; 426
	i32 253, ; 427
	i32 161, ; 428
	i32 242, ; 429
	i32 140, ; 430
	i32 265, ; 431
	i32 261, ; 432
	i32 169, ; 433
	i32 190, ; 434
	i32 197, ; 435
	i32 174, ; 436
	i32 203, ; 437
	i32 270, ; 438
	i32 40, ; 439
	i32 229, ; 440
	i32 81, ; 441
	i32 56, ; 442
	i32 37, ; 443
	i32 97, ; 444
	i32 166, ; 445
	i32 172, ; 446
	i32 266, ; 447
	i32 82, ; 448
	i32 205, ; 449
	i32 98, ; 450
	i32 30, ; 451
	i32 159, ; 452
	i32 193, ; 453
	i32 18, ; 454
	i32 127, ; 455
	i32 119, ; 456
	i32 225, ; 457
	i32 256, ; 458
	i32 238, ; 459
	i32 193, ; 460
	i32 258, ; 461
	i32 165, ; 462
	i32 233, ; 463
	i32 315, ; 464
	i32 288, ; 465
	i32 255, ; 466
	i32 246, ; 467
	i32 170, ; 468
	i32 16, ; 469
	i32 144, ; 470
	i32 125, ; 471
	i32 118, ; 472
	i32 38, ; 473
	i32 115, ; 474
	i32 47, ; 475
	i32 142, ; 476
	i32 117, ; 477
	i32 34, ; 478
	i32 176, ; 479
	i32 95, ; 480
	i32 53, ; 481
	i32 247, ; 482
	i32 129, ; 483
	i32 153, ; 484
	i32 24, ; 485
	i32 161, ; 486
	i32 224, ; 487
	i32 148, ; 488
	i32 104, ; 489
	i32 89, ; 490
	i32 212, ; 491
	i32 60, ; 492
	i32 142, ; 493
	i32 100, ; 494
	i32 5, ; 495
	i32 13, ; 496
	i32 122, ; 497
	i32 135, ; 498
	i32 28, ; 499
	i32 288, ; 500
	i32 72, ; 501
	i32 222, ; 502
	i32 24, ; 503
	i32 210, ; 504
	i32 251, ; 505
	i32 248, ; 506
	i32 305, ; 507
	i32 137, ; 508
	i32 203, ; 509
	i32 219, ; 510
	i32 168, ; 511
	i32 252, ; 512
	i32 284, ; 513
	i32 101, ; 514
	i32 123, ; 515
	i32 223, ; 516
	i32 179, ; 517
	i32 163, ; 518
	i32 167, ; 519
	i32 226, ; 520
	i32 39, ; 521
	i32 186, ; 522
	i32 303, ; 523
	i32 17, ; 524
	i32 171, ; 525
	i32 304, ; 526
	i32 137, ; 527
	i32 150, ; 528
	i32 215, ; 529
	i32 155, ; 530
	i32 130, ; 531
	i32 19, ; 532
	i32 65, ; 533
	i32 147, ; 534
	i32 47, ; 535
	i32 312, ; 536
	i32 314, ; 537
	i32 201, ; 538
	i32 79, ; 539
	i32 61, ; 540
	i32 106, ; 541
	i32 250, ; 542
	i32 205, ; 543
	i32 49, ; 544
	i32 236, ; 545
	i32 309, ; 546
	i32 247, ; 547
	i32 14, ; 548
	i32 178, ; 549
	i32 68, ; 550
	i32 171, ; 551
	i32 211, ; 552
	i32 215, ; 553
	i32 196, ; 554
	i32 78, ; 555
	i32 220, ; 556
	i32 108, ; 557
	i32 204, ; 558
	i32 246, ; 559
	i32 67, ; 560
	i32 63, ; 561
	i32 27, ; 562
	i32 160, ; 563
	i32 284, ; 564
	i32 213, ; 565
	i32 10, ; 566
	i32 186, ; 567
	i32 11, ; 568
	i32 173, ; 569
	i32 78, ; 570
	i32 126, ; 571
	i32 83, ; 572
	i32 180, ; 573
	i32 66, ; 574
	i32 107, ; 575
	i32 65, ; 576
	i32 128, ; 577
	i32 122, ; 578
	i32 77, ; 579
	i32 261, ; 580
	i32 251, ; 581
	i32 8, ; 582
	i32 219, ; 583
	i32 2, ; 584
	i32 300, ; 585
	i32 44, ; 586
	i32 264, ; 587
	i32 156, ; 588
	i32 128, ; 589
	i32 249, ; 590
	i32 23, ; 591
	i32 133, ; 592
	i32 207, ; 593
	i32 238, ; 594
	i32 29, ; 595
	i32 206, ; 596
	i32 62, ; 597
	i32 188, ; 598
	i32 90, ; 599
	i32 87, ; 600
	i32 148, ; 601
	i32 286, ; 602
	i32 190, ; 603
	i32 36, ; 604
	i32 86, ; 605
	i32 227, ; 606
	i32 310, ; 607
	i32 179, ; 608
	i32 50, ; 609
	i32 6, ; 610
	i32 90, ; 611
	i32 310, ; 612
	i32 21, ; 613
	i32 162, ; 614
	i32 96, ; 615
	i32 50, ; 616
	i32 113, ; 617
	i32 243, ; 618
	i32 130, ; 619
	i32 76, ; 620
	i32 27, ; 621
	i32 299, ; 622
	i32 0, ; 623
	i32 220, ; 624
	i32 242, ; 625
	i32 7, ; 626
	i32 187, ; 627
	i32 175, ; 628
	i32 110, ; 629
	i32 243, ; 630
	i32 229 ; 631
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
