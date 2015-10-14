part of GameWindow;

typedef void OnLoadCallback(List<AudioBuffer> bufferList);

class BufferLoader {
  AudioContext audioCtx;
  List<String> urlList;
  OnLoadCallback callback;
  int _loadCount = 0;
  List<AudioBuffer> _bufferList;

  BufferLoader(this.audioCtx, this.urlList, this.callback) {
    _bufferList = new List<AudioBuffer>(urlList.length);
  }

  void load() {
    for (var i = 0; i < urlList.length; i++) {
      _loadBuffer(urlList[i], i);
    }
  }

  void _loadBuffer(String url, int index) {
    // Load the buffer asynchronously.
    var request = new HttpRequest();
    request.open("GET", url, async: true);
    request.responseType = "arraybuffer";
    request.onLoad.listen((e) => _onLoad(request, url, index));

    // Don't use alert in real life ;)
    request.onError.listen((e) => window.alert("BufferLoader: XHR error"));

    request.send();
  }

  void _onLoad(HttpRequest request, String url, int index) {
    // Asynchronously decode the audio file data in request.response.
    audioCtx.decodeAudioData(request.response).then((AudioBuffer buffer) {
      if (buffer == null) {

        // Don't use alert in real life ;)
        window.alert("Error decoding file data: $url");

        return;
      }
      _bufferList[index] = buffer;
      if (++_loadCount == urlList.length) callback(_bufferList);
    });
  }
}

/**
 * This is the global, application context.
 *
 * In the JavaScript version, this stuff was in a file called init.js. I'm
 * keeping it separate of FilterSample in case we want to implement additional
 * samples.
 */
class ApplicationContext {
  // Keep track of all loaded buffers.
  Map<String, AudioBuffer> buffers;

  // Page-wide AudioContext.
  AudioContext audioCtx;

  // An object to track the buffers to load "{name: path}".
  Map buffersToLoad;

  ApplicationContext(Map inputBuffers) {
    buffers = new Map<String, AudioBuffer>();
    audioCtx = new AudioContext();
    buffersToLoad = new Map.from(inputBuffers);

    _loadBuffers();
  }

  // Loads all sound samples into the buffers object.
  void _loadBuffers() {
    List<String> names = buffersToLoad.keys.toList();
    List<String> paths = buffersToLoad.values.toList();
    var bufferLoader = new BufferLoader(audioCtx, paths, (List<AudioBuffer> bufferList) {
      for (var i = 0; i < bufferList.length; i++) {
        AudioBuffer buffer = bufferList[i];
        String name = names[i];
        buffers[name] = buffer;
      }
    });
    bufferLoader.load();
  }
}

class AudioPlayer {
  final _FREQ = 5000;
  final _FREQ_MUL = 7000;
  final _QUAL_MUL = 30;
  bool _playing = false;
  ApplicationContext appCtx;
  AudioBufferSourceNode _source;
  BiquadFilterNode _filter;

  AudioPlayer() {
    appCtx = new ApplicationContext();
  }

  void play(String audioName) {
    // Create the source.
    _source = appCtx.audioCtx.createBufferSource();
    _source.buffer = appCtx.buffers[audioName];

    // Create the filter.
    _filter = appCtx.audioCtx.createBiquadFilter();
    _filter.type = "lowpass";
    _filter.frequency.value = _FREQ;

    // Connect everything.
    _source.connectNode(_filter, 0, 0);
    _filter.connectNode(appCtx.audioCtx.destination, 0, 0);

    // Play!
    _source.start(0);
    _source.loop = false;
  }

  void stop() {
    _source.stop(0);
  }
}