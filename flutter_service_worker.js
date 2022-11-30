'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/FETCH_HEAD": "f4b726338509f0fed06eecbbb772e887",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/fsmonitor-watchman.sample": "db4d62db2039e4bec38baa7567788284",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-commit.sample": "e4db8c12ee125a8a085907b757359ef0",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/config": "ba4639db4b624f58efb465bdab8551a2",
".git/COMMIT_EDITMSG": "4f58b0efe690085caaf12a49b624f8b4",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/refs/remotes/origin/gh-pages": "0b1f9157e7877529bd4fd8ae0ca8f170",
".git/logs/refs/remotes/origin/main": "f5928ea6bb41e2df07f4f7beda439bed",
".git/logs/refs/heads/gh-pages": "e8cc2110e275ba0725ee18b8508d8d02",
".git/logs/refs/heads/main": "5d01b8a4ad38ea76c21be720e3360c66",
".git/logs/HEAD": "85b202f3c95e44538e5fea8968719592",
".git/index": "d6081f6a714b470e4ab5eaa513290670",
".git/refs/remotes/origin/gh-pages": "47ef1bc28e288baf43b308e6a73682e2",
".git/refs/remotes/origin/main": "48762d45ada55e5fd253de944c48baa3",
".git/refs/heads/gh-pages": "47ef1bc28e288baf43b308e6a73682e2",
".git/refs/heads/main": "47ef1bc28e288baf43b308e6a73682e2",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/objects/67/61f7e9ef54fc51fa2b951ccd5355f8a06f6f5f": "5063cf0bdce86bbdd3a0b223f572ebab",
".git/objects/81/24329a7794dbbfe324242e34dcdcc32f33b9de": "52a9264212b8aaddf4ff9bdb5e7bf988",
".git/objects/81/5368985ec97169aeb37e410dd49c852621f004": "6a8f19c2c8fa3536104404249ee26b09",
".git/objects/08/e6104815ef132931ebff4b318d2631f201e8da": "0e03b6d570d47680e8c9f833253457c2",
".git/objects/12/5c284dc2bbed823ed6389e50cc75a8a1ef2351": "9ab0bcea773dc4fd6ef989aef459b28a",
".git/objects/53/442084da1e553b3f76e63d7e3951b96e455418": "2eaf2ea020382958ee79ee8f14d29baf",
".git/objects/7e/8e62536d478b611774e65a45f602c20d59fe3c": "3de516d00de043848dc21520792c8a31",
".git/objects/ec/19b6e429f5ee2b12b6d0f80ee17f1efd156ce6": "655b09b01f86a0353e530fddbb6ba8b3",
".git/objects/pack/pack-6b792294b353d91dfd880c7cd719f51885525103.idx": "7875fb4128694bcdd3587b7c144a42b1",
".git/objects/pack/pack-6b792294b353d91dfd880c7cd719f51885525103.pack": "c8737a6c55323dfa936b08f8118c8e24",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/fb/4f3b951a18c17876d7a68d93efe6e54c8ef151": "0c0d1a28593dfebbc04d93287bbca44c",
".git/objects/07/e85e3dcbfe2b4cec822cc34820c6dbaa29baa9": "a20221e120551cb83541880bc202a612",
".git/objects/01/5b1df5f71f5e81d82973ea382a480837890b21": "e153795a972266b0a41ae41ac5600fbd",
".git/objects/0f/e17598ee384add2d50c11cf6acf4f0d9d098d3": "d2a19432cc7ae291e5ee391babd67456",
".git/objects/37/7ead7488ba04497de54363ee4e4436edf85774": "d08a584d3f7b4fb2a65c159d695456ff",
".git/objects/43/fd9c5b8ec9c13d90c2e65277fe957e76ecae2b": "bb05749410681282fd4a26e662d61aac",
".git/objects/ab/0e98497a51ead7821d1da35a24968ff314e50f": "557c35fe3928eb2af403d1b3926bb9ba",
".git/objects/d3/e7fe32b916cbe7d26679bc36dd940a7d6a7efd": "a2ebd33176d96ae0a0bc70fd0cf4a49d",
".git/objects/5d/eb6486519a5b755eb005c6ade946e1d1f0dd8d": "95f91db8d9946ad114ef917ebe7024c8",
".git/objects/00/19574e10dba2abb074a87f12489bda331e1f09": "85f6591f856a1afa592c2019a7f0f90a",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/a1/cbdb11db293d90e8eab8c0105b908317c5e59f": "0036ebc09009928d2cbf10300ee614d9",
".git/objects/a1/a3e444d27d45d3afe9a2e7b8ab13bbfec7d554": "2cea4e67f0d18be8d6973b39fcc42df5",
".git/objects/73/a5ca9e6ea457a8e87e3e88047b9268f15bb75b": "437e873491b95548ba60fecc00fa7933",
".git/objects/73/729a16163c9e1d194fd51573359f5ebcb1ade3": "9440659d59631af17fed0613f50fd6f6",
".git/objects/94/a429d72b31d507b0e4d15b9e97aa6f36cf182c": "1a994987f618affe0934f5b9bae94e90",
".git/objects/55/919b0b32f21410d9755ffbe64aeb2d07650744": "ffb88073b04c5f9454f1e7f08edc733c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/b6/ea11da8af8f00def6d4ae4886e7b725bbd3931": "69c85a593de17433887391251b0e49e6",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c4/8408bb124bcf88ac65b357b7dcf88863e8463c": "5626eb537ecb6a7f8ea0c5816cb0cb4e",
".git/objects/d4/3ed8815470dc79c7961688b8e40352ed77a3df": "220b25000ea53974ee7ac60f5aac573e",
".git/objects/4b/ce11f832f26ee264d95b6790237601cf5a6088": "d9243641979aa81a886b057ab392745a",
".git/objects/9b/6d9522800fb679a7ed338d27ebcef6cad4b046": "916ffb44db53443aaf99d17c63a4099a",
".git/objects/c8/557910a3fd7291d5fd74f75d3555671b8b3cf0": "e4172bcd902b50bbd1573d6a1a0f9eea",
".git/objects/58/f071e8caa994ff79bfd280b6df391a7a6aa766": "131b0d037c3efdb26a50068ff911f569",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f6/74946fe03e2c81fd0726edc8d518658af0d687": "08deb872498df316704763c5ba8cf7a2",
".git/objects/7f/7cbd36bc93389b3b2f7196427ba35777c9cd20": "58b0f2c41a7c6556116de6b1d3cf8a00",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/2d/03271fd821ff18d44a79eb2ffd712ad9b3af50": "a0205d9ae4a40b6524bda4b86715e72c",
".git/objects/96/72d849df75fa7a54b6478d75d765d55a6b2740": "b914dc9d0767f1144a9e8813d0e429ae",
".git/objects/96/be6c86e58112e1f509063bea4edd75a7c98433": "b5f295228a9d8c40667978c8c50fcd7b",
".git/objects/27/a6e839f03f7895e72cb992516c540709d0a0d9": "f79f9da64d6b11424f006e0c476b787f",
".git/objects/b4/1eb628e31decd226d89738012f0cb9f3e27623": "e9a714b941b05df66c06950aed43a8a0",
".git/objects/b4/16278dde7da37a708a776e02656ca15c08c5ed": "d3120700e375530ac712acf679c1055f",
".git/objects/40/daf4d124038f4491e90d99d4ba5bc3bd868806": "80bff0328998da6e7d8dcc3bf062fe93",
".git/objects/40/a2580b9e23f7a55944e8cc390ea2df30305d07": "8d7d32ab16dd67c309ad26f7c0c69480",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/03/eaddffb9c0e55fb7b5f9b378d9134d8d75dd37": "87850ce0a3dd72f458581004b58ac0d6",
".git/objects/8c/99266130a89547b4344f47e08aacad473b14e0": "41375232ceba14f47b99f9d83708cb79",
".git/objects/d8/b00825b96946b53c37c9996841ccadc45b29b5": "23801cd6e841b2a357c97f5b0d3bb708",
".git/objects/21/ca1d78a88d531c2b6f0195c7e432df66473ee0": "e09eb59b74d56c69cd6afa5e89c94051",
".git/objects/88/7b727398d347942c9c20d803fb45fed98e63f8": "09220187e970fbcedf7c7a995e961e66",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/41/5c059c8094b888b0159fdedfd4e3cb08a8028e": "86914685ccd40e82a7fe5b70459fb9f7",
".git/objects/49/938d3f0c07beb7194c72b623c46ebc2acc28a1": "c52513b902ead034bc9a32ad0ecef9b8",
".git/objects/75/ed8526ad84b6b3d30560f976bda17b2e99bf53": "08c28dcff3b9bf163564af0f554576a5",
".git/objects/75/f9447c192b9fb221acefbdbd03a5a68bdf4b91": "2fb9894c6d444bf5070984319a291011",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4a/e376a19c83cf357d021b8488796d05c9202df5": "8fcfbf73fc3a915ad114d362e6697424",
".git/objects/02/30d90f7d379de0889643b497d7382217747a62": "8afc920a88a342687ad5d6f5ccfa3194",
".git/objects/ea/6d7aae60eba56025b99f0ac7c8846f90d45276": "0bd5b23f44196139f5f5b7290aadc614",
".git/objects/ca/f588bdc418cd6d06b64778d5b2f7acbf802559": "675ee9e42f88cdc19df5bee292af8d98",
".git/objects/1f/1bf6325aa0bcf1599c32d41569108ec85ab154": "9084d1acdc17f3d4f6e83cc3f95516b3",
".git/objects/6a/562868741911ffc3a5345f3c094a71eb0d073d": "ad3237b80e6dc65be0e2000c6c0a445f",
".git/objects/ee/b8df0195a0d0ae28a3bad962e427a1c7692d3a": "0375985a7264a4c3dc029a811d02c854",
".git/objects/4d/ef8d54ee5b1f7c01d763583adb06e6c7f0966b": "262ed6df6e51e167d0f9f92094026b7a",
"manifest.json": "33d4644868bdb559b3878c11fb706b0a",
"README.md": "1d2a65ba143f896d8f05bd8ecb3f644e",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"version.json": "9a1b238e8486aee4e94365397bef5313",
"index.html": "8ffd44534178e8fa43843ca9fcbd4cc4",
"/": "8ffd44534178e8fa43843ca9fcbd4cc4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"main.dart.js": "2dc754ef1ea5a02d2bd5c74540a99864",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "52aeb91c5fc0e21a3e3d8c35172f9ce7",
"assets/shaders/ink_sparkle.frag": "92666cc97576adbea2e2d3061a953137",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
