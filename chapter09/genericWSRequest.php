<?php

// URL to download and output
$url = 'http://p.moreover.com/cgi-local/page?c=Web%20developer%20news&o=xml';

// Check if allow_url_fopen is set to on in the config
$allow_url_fopen = ini_get('allow_url_fopen');
if ($allow_url_fopen != 1) {
    // If it isn't, set it to on temporarily
    if (ini_set('allow_url_fopen', 1) === false) {
        die('ERROR: Could not set allow_url_fopen, halting.');
    }
}

$xml = '';
// Create a file pointer and read the data from the
// URL into the $xml variable
$data = file_get_contents($url);
if ($data !== false) {
    $xml = DOMDocument::loadXML($data);
    if ($xml === false) {
	die('ERROR: Could not load XML data. The data may be invalid.');
    }
}
else {
    die("ERROR: Could not open URL: " . $url);
}
    

// If allow_url_fopen was off before, set it to off again.
// Otherwise, leave it.
if ($allow_url_fopen != 1) {
    ini_set('allow_url_fopen', 0);
}

// Set the content type header and output the XML.
header('Content-Type: text/xml');
print $xml->saveXML();

?>
