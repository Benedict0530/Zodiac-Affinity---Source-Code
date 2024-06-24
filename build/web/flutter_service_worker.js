'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "88f8ded44d93621ab31fd0affc5c3c41",
".git/config": "333bb49d36baf25fe3ba8953d9f6bec9",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "ceeabbf355a62bb2830358358660d32b",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "2398c088a60efe5256f84f843b817c3f",
".git/logs/refs/heads/main": "fc0c87cc98f3061aef86d8d71f4ea923",
".git/logs/refs/remotes/origin/main": "806f79fe0831e79a267b79003f60ba06",
".git/objects/0f/c344c7e8b9e32ea1ad91f30ded22556352d7bf": "a8a30f28869f7378465338066f34d80d",
".git/objects/14/043f59fcf795fd1efa21e687aeccb7a1084dc4": "240f63bee2a954f7d22ec4b5fa0e5a12",
".git/objects/18/eb401097242a0ec205d5f8abd29a4c5e09c5a3": "4e08af90d04a082aab5eee741258a1dc",
".git/objects/1a/357a8b2a99187ebb68b1283d5e74bd9dfc4424": "f427bbec0e7a91f7ffb082e2924d4664",
".git/objects/1c/274551c8110f5678f613289e1989c6b7f530cf": "9ecd361d172d20577c8c0cb6ba8c920c",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/20/b4a83ae2bdf583b4b875ecae635d931f376715": "8a47e0ad409f0eff1a1c27156a799300",
".git/objects/20/cb2f80169bf29d673844d2bb6a73bc04f3bfb8": "b807949265987310dc442dc3f9f492a2",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/objects/2d/f77c62bff542dd931d06db37ff56cd4eb848fa": "6e0a0c984a3c09608be8032a9f75dd9a",
".git/objects/30/be132a8f0a2fe8168d15c8a9dc8892592be966": "6bce57cd07a7d010ab342c2001816a3b",
".git/objects/41/b25916b727527e225f6b5037a5c72ba6332d9c": "b7e394dc46122dd5138db3dae4ab2303",
".git/objects/42/56ffb8c696b07d86df605d180eaa781394a7ce": "aeb52c496bc5c5bb7931286cb109c15e",
".git/objects/49/adebdb511c8c293b28db3f6792e5bac28cdc32": "ba6a3971e7f06834fd6ec3844372ce17",
".git/objects/49/d660e046e3883e38554032692d32df791fb73b": "dd8ce95d9d935d919e1d2ceebcd231ce",
".git/objects/4d/9bf42c77b4fc936bea1985166ef68288ee9281": "aeec1aec7170a2366517207e8417c07e",
".git/objects/4d/a3850907b62fe5328f965a154b7390a341a8d3": "5f275c09a5085e2fae08f999ea2601b3",
".git/objects/53/f1fb24edce8eab6898047baa44eec0c05b6104": "8a973ea9558a85527a60aefd8c893168",
".git/objects/58/356635d1dc89f2ed71c73cf27d5eaf97d956cd": "f61f92e39b9805320d2895056208c1b7",
".git/objects/58/b007afeab6938f7283db26299ce2de9475d842": "6c6cbea527763bb3cdff2cecfee91721",
".git/objects/61/3ff5ebfb9705e3532e95313afcd3254ee65615": "2d5968da162e1c94be45e9ecf166d896",
".git/objects/61/b83982e5e2f9319ad5efd4d9e0637ebde92c21": "ba2a43e5ae24f93cb13fc56476986ae8",
".git/objects/62/c89ee094658c7a9465824fdb42793a64ea557b": "133cd5da638f245b079d9e9cdc29ae38",
".git/objects/65/89b80715fec678728bcfd557c4bc7b9c8d23b4": "b777d83e0af4628035eb070becdb71ee",
".git/objects/71/3f932c591e8f661aa4a8e54c32c196262fd574": "66c6c54fbdf71902cb7321617d5fa33c",
".git/objects/73/999b4332146ef30c552b1468408bc19d1a8c58": "3ba69c03d049e11152bc4f47103dce6f",
".git/objects/7b/e52480f3ab34a337b3c278df72e735937e3f45": "349c13f872d4dbeb3d33261dda49bbcb",
".git/objects/7c/09d499f23e8c9cfadbd067e09e62b423cd8b4a": "4f5d6ea007527788d254cd3ceeb9b8a8",
".git/objects/7c/5908a78733e3765d3951f40d0f497fcf17d26a": "315836ee15327637b3b4fbfeb91025fe",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/88/59556a53a64f94c919dcc83ceac477efb313cd": "a5452e24f78adec80054fdb58e9deeee",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/93/d6eaaff43211eacb03d62985a6df2e0bc3f2c9": "3211edb4b25b395769e0e146f9751a04",
".git/objects/94/f7d06e926d627b554eb130e3c3522a941d670a": "77a772baf4c39f0a3a9e45f3e4b285bb",
".git/objects/a3/2035e56f8feac1b75a6986260242281f51fcab": "4f6b167d396e4e885941d9812e0446b8",
".git/objects/a8/e804b8d1b668ed0393af2298a8f260df744163": "9618bfe072b027e0c6e2541a5e35418e",
".git/objects/a9/b74d4f33f7170a87f29227cc919acd5be16c3c": "af7c1ba42cbfdd88e2c554fd67060c70",
".git/objects/b3/ebbd38f666d4ffa1a394c5de15582f9d7ca6c0": "23010709b2d5951ca2b3be3dd49f09df",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/ba/a1779fb3c6609061b25e43366aa79a26c5557d": "e06d6b64ec9b9ef6d7e7b3d24e09e80a",
".git/objects/c3/c47fb21dca1f275d49e8fe1a8f6c3ff28ef4d1": "6acc5478e2cd7a1d2f2b5626ff7abe72",
".git/objects/c4/3d9520e50fee7da6818757df2796afc2c79ab9": "6ee5492e98c0abeba0b887be679b1f41",
".git/objects/c7/45cbbfa1476a16b539ad9efe264f387b49a693": "e2d4f6ff07d559a1bd1ae7cefc4fb366",
".git/objects/c9/9e8117641b1d407eec571a0dd6ab6c1cafb1fc": "3ad45e2c4c64664c5424512740877ac0",
".git/objects/c9/bf8af1b92c723b589cc9afadff1013fa0a0213": "632f11e7fee6909d99ecfd9eeab30973",
".git/objects/ca/8482c88c44dcfdf9ead9d3726df9574ac9775c": "81cbf504c8b90bc81a07b514349a4ac5",
".git/objects/ca/af00b1bda999e70d0665e92c4ba43c263fdae7": "53e05fa6ba4dbf777dc00ba1668c718c",
".git/objects/d1/098e7588881061719e47766c43f49be0c3e38e": "f17e6af17b09b0874aa518914cfe9d8c",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d5/d417cfa206f9f5bd5a28afd6fbd4b22347f081": "323748ca793d8236b4f6096748eaa5ba",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d8/bff0630dfd610fda4f0ab2c61aa1cd33dd7314": "ef393cb2cae01a966daf61fa446f2434",
".git/objects/e5/c18a52b1d10822d6d27c884c7cbe88b350461c": "a73c72ad02fe678f1bf50c63835352bd",
".git/objects/ea/2a16af413fe229ad2747577c6dd907a4414f23": "afbf6010ee1463125250f9842322c95f",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/fa/5268268eeb517b59f44ec84935645c4782a326": "04b583793f5604caee91f2ac9a5b1ff4",
".git/refs/heads/main": "e43d83551f9f2b7f0143d5590fe390eb",
".git/refs/remotes/origin/main": "e43d83551f9f2b7f0143d5590fe390eb",
"assets/AssetManifest.bin": "e1707fdaa447753ea48d25dd215756b3",
"assets/AssetManifest.bin.json": "9dfd17c1b0ea52640e8c00584bf1e219",
"assets/AssetManifest.json": "6fa70633bbe46fe790a974b2a92bca3c",
"assets/assets/Aquarius.png": "29c18fb0b20a29f22b11e869b159c48e",
"assets/assets/Aries.png": "70d3da2a646876620fd3cef40815ba8e",
"assets/assets/background.png": "cb5f0bc6f92764433e7126416a145d23",
"assets/assets/Cancer.png": "ce4e4f2d30cd349cd81bd2ec95e5888f",
"assets/assets/Capricorn.png": "f4266bc7171a2360201f5fbf7dcf985b",
"assets/assets/check_nav.png": "b3c499cbe29b3cc236c15bad680a1430",
"assets/assets/fonts/boorsok.otf": "6ca86003465fb9e5ea952b5dbf46e91d",
"assets/assets/Gemini.png": "d32389f8d581ddd09002369a9f446a4c",
"assets/assets/icon.png": "b0c09209948d54f658658ba48dc8d705",
"assets/assets/Leo.png": "e5b852816e2311754a44d6b2f3b37491",
"assets/assets/Libra.png": "be121d6bb99a39498a791318431f95a6",
"assets/assets/nav.png": "c4c6889cc1e428259df8711c900f0319",
"assets/assets/Pisces.png": "d5ab2286017de82f9ab275b936b4303a",
"assets/assets/Sagittarius.png": "182ad98b0c797496c88881c7001b4d74",
"assets/assets/Scorpio.png": "dab53a326c5d3fc12b064f48b768ac5b",
"assets/assets/Taurus.png": "b49e20427aef01064a20360cda4ab8e5",
"assets/assets/Virgo.png": "54d3516ff9452e91351ef17e71eb5c2c",
"assets/FontManifest.json": "d3cf0a108b32e27f4f99793e19f8bde1",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/NOTICES": "26ba29ba659cc5d016ebace6b1b2c7c1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "2774222a21edeec384a1666d589c82b2",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "dd28ba9b7ba128634dd4395ec7808552",
"/": "dd28ba9b7ba128634dd4395ec7808552",
"main.dart.js": "32b49d19be1e3de051ae6c08c9883cb3",
"manifest.json": "b4449bee54ece779bdadd3cd7268a39a",
"version.json": "cc24b75b8510040319a646f91b567989"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
