<?php

// Path to the folder
$directoryLocation = 'e:\mp3z';

// XML Doctype
$xml = new DomDocument('1.0', 'UTF-8');
$xml->xmlStandalone = false;
// XML Root element
$root = $xml->createElement('mp3s');
$root = $xml->appendChild($root);

// Grab a list of folders from the specified directory
if ($dir = @opendir($directoryLocation)) {
    while (false !== ($file = readdir($dir))) {
        if (is_dir($directoryLocation . DIRECTORY_SEPARATOR . $file) && $file != '.' && $file != '..') {
            // If it is a folder, put it in the folders array
            $folders[] = $file;
        }
    }

    // Sort the array of folders
    natcasesort($folders);

    // Iterate through each folder
    foreach ($folders as $foldername) {
        // Create the folder xml node
        $folder = $xml->createElement('folder');
        $folder->setAttribute('foldername', $foldername);
        $folder = $root->appendChild($folder);
        
        $mp3s = array();
        // Grab a list of mp3s from the subfolder
        if ($subdir = @opendir($directoryLocation . DIRECTORY_SEPARATOR . $foldername)) {
            while ( false !== ($file = readdir($subdir)) ) {
                if ( strtolower(substr(strrchr($file, '.'), 1)) == 'mp3' ) {
                    // Add them to an array of mp3s
                    $mp3s[] = $file;
                    
                }
            }
        }
        else {
            die("ERROR: Could not open directory: " . $file);
        }
        
        // Sort the array of mp3s
        natcasesort($mp3s);
        foreach ($mp3s as $mp3) {
            // Create each song xml node
            $song = $xml->createElement('song');
            $song->setAttribute('filename', $mp3);
            $song = $folder->appendChild($song);
        }
    }
}
else {
    die("ERROR: Could not open folder: " . $directoryLocation);
}

// Set the content type so the external program
// detects it as XML.
header('Content-Type: text/xml');
// Print the XML to the screen
print $xml->saveXML();

?>
