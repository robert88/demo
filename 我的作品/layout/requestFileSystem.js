// Note: The file system has been prefixed as of Google Chrome 12:
window.requestFileSystem  = window.requestFileSystem || window.webkitRequestFileSystem;

window.requestFileSystem(type, size, successCallback, opt_errorCallback)
function onInitFs(fs) {
  console.log('Opened file system: ' + fs.name);
}

window.requestFileSystem(window.TEMPORARY, 5*1024*1024 /*5MB*/, onInitFs, errorHandler);
function errorHandler(e) {
  var msg = '';

  switch (e.code) {
    case FileError.QUOTA_EXCEEDED_ERR:
      msg = 'QUOTA_EXCEEDED_ERR';
      break;
    case FileError.NOT_FOUND_ERR:
      msg = 'NOT_FOUND_ERR';
      break;
    case FileError.SECURITY_ERR:
      msg = 'SECURITY_ERR';
      break;
    case FileError.INVALID_MODIFICATION_ERR:
      msg = 'INVALID_MODIFICATION_ERR';
      break;
    case FileError.INVALID_STATE_ERR:
      msg = 'INVALID_STATE_ERR';
      break;
    default:
      msg = 'Unknown Error';
      break;
  };
  window.webkitStorageInfo.requestQuota(PERSISTENT, 1024*1024, function(grantedBytes) {
  window.requestFileSystem(PERSISTENT, grantedBytes, onInitFs, errorHandler);
}, function(e) {
  console.log('Error', e);
});
fileEntry.isFile === true
fileEntry.isDirectory === false
fileEntry.name
fileEntry.fullPath
...

fileEntry.getMetadata(successCallback, opt_errorCallback);
fileEntry.remove(successCallback, opt_errorCallback);
fileEntry.moveTo(dirEntry, opt_newName, opt_successCallback, opt_errorCallback);
fileEntry.copyTo(dirEntry, opt_newName, opt_successCallback, opt_errorCallback);
fileEntry.getParent(successCallback, opt_errorCallback);
fileEntry.toURL(opt_mimeType);

fileEntry.file(successCallback, opt_errorCallback);
fileEntry.createWriter(successCallback, opt_errorCallback);
  console.log('Error: ' + msg);
}

function onInitFs(fs) {

  fs.root.getFile('log.txt', {create: true, exclusive: true}, function(fileEntry) {

    // fileEntry.isFile === true
    // fileEntry.name == 'log.txt'
    // fileEntry.fullPath == '/log.txt'

  }, errorHandler);

}

window.requestFileSystem(window.TEMPORARY, 1024*1024, onInitFs, errorHandler);

function onInitFs(fs) {

  fs.root.getFile('log.txt', {}, function(fileEntry) {

    // Get a File object representing the file,
    // then use FileReader to read its contents.
    fileEntry.file(function(file) {
       var reader = new FileReader();

       reader.onloadend = function(e) {
         var txtArea = document.createElement('textarea');
         txtArea.value = this.result;
         document.body.appendChild(txtArea);
       };

       reader.readAsText(file);
    }, errorHandler);

  }, errorHandler);

}

window.requestFileSystem(window.TEMPORARY, 1024*1024, onInitFs, errorHandler);

function onInitFs(fs) {

  fs.root.getFile('log.txt', {create: true}, function(fileEntry) {

    // Create a FileWriter object for our FileEntry (log.txt).
    fileEntry.createWriter(function(fileWriter) {

      fileWriter.onwriteend = function(e) {
        console.log('Write completed.');
      };

      fileWriter.onerror = function(e) {
        console.log('Write failed: ' + e.toString());
      };

      // Create a new Blob and write it to log.txt.
      var bb = new BlobBuilder(); // Note: window.WebKitBlobBuilder in Chrome 12.
      bb.append('Lorem Ipsum');
      fileWriter.write(bb.getBlob('text/plain'));

    }, errorHandler);

  }, errorHandler);

}

window.requestFileSystem(window.TEMPORARY, 1024*1024, onInitFs, errorHandler);

function onInitFs(fs) {

  fs.root.getFile('log.txt', {create: false}, function(fileEntry) {

    // Create a FileWriter object for our FileEntry (log.txt).
    fileEntry.createWriter(function(fileWriter) {

      fileWriter.seek(fileWriter.length); // Start write position at EOF.

      // Create a new Blob and write it to log.txt.
      var bb = new BlobBuilder(); // Note: window.WebKitBlobBuilder in Chrome 12.
      bb.append('Hello World');
      fileWriter.write(bb.getBlob('text/plain'));

    }, errorHandler);

  }, errorHandler);

}

window.requestFileSystem(window.TEMPORARY, 1024*1024, onInitFs, errorHandler);
复制用户选定的文件

以下代码可让用户使用 <input type="file" multiple /> 选择多个文件，并在应用的沙盒文件系统中复制这些文件。

<input type="file" id="myfile" multiple />

document.querySelector('#myfile').onchange = function(e) {
  var files = this.files;

  window.requestFileSystem(window.TEMPORARY, 1024*1024, function(fs) {
    // Duplicate each file the user selected to the app's fs.
    for (var i = 0, file; file = files[i]; ++i) {

      // Capture current iteration's file in local scope for the getFile() callback.
      (function(f) {
        fs.root.getFile(file.name, {create: true, exclusive: true}, function(fileEntry) {
          fileEntry.createWriter(function(fileWriter) {
            fileWriter.write(f); // Note: write() can take a File or Blob object.
          }, errorHandler);
        }, errorHandler);
      })(file);
	  
	  window.requestFileSystem(window.TEMPORARY, 1024*1024, function(fs) {
  fs.root.getFile('log.txt', {create: false}, function(fileEntry) {

    fileEntry.remove(function() {
      console.log('File removed.');
    }, errorHandler);

  }, errorHandler);
}, errorHandler);

dirEntry.isDirectory === true
// See the section on FileEntry for other inherited properties/methods.
...

var dirReader = dirEntry.createReader();
dirEntry.getFile(path, opt_flags, opt_successCallback, opt_errorCallback);
dirEntry.getDirectory(path, opt_flags, opt_successCallback, opt_errorCallback);
dirEntry.removeRecursively(successCallback, opt_errorCallback);
...

window.requestFileSystem(window.TEMPORARY, 1024*1024, function(fs) {
  fs.root.getDirectory('MyPictures', {create: true}, function(dirEntry) {
    ...
  }, errorHandler);
}, errorHandler);

var path = 'music/genres/jazz/';

function createDir(rootDirEntry, folders) {
  // Throw out './' or '/' and move on to prevent something like '/foo/.//bar'.
  if (folders[0] == '.' || folders[0] == '') {
    folders = folders.slice(1);
  }
  rootDirEntry.getDirectory(folders[0], {create: true}, function(dirEntry) {
    // Recursively add the new subfolder (if we still have another to create).
    if (folders.length) {
      createDir(dirEntry, folders.slice(1));
    }
  }, errorHandler);
};

function onInitFs(fs) {
  createDir(fs.root, path.split('/')); // fs.root is a DirectoryEntry.
}

window.requestFileSystem(window.TEMPORARY, 1024*1024, onInitFs, errorHandler);

window.requestFileSystem(window.TEMPORARY, 1024*1024, function(fs) {
  fs.root.getFile('/music/genres/jazz/song.mp3', {create: true}, function(fileEntry) {
    ...
  }, errorHandler);
}, errorHandler);