<?php

$data = '';
$xml = '';

// Make sure that we receive the raw post data no matter what
ini_set('always_populate_raw_post_data', 1);
// get the contents of the raw POST data
$data = file_get_contents('php://input');

if ($data !== false) {
    $xml = DOMDocument::loadXML($data);

    if ($xml === false) {
	die('ERROR: Could not load the XML data. The data is possibly invalid XML.');
    }
}
else {
    die('ERROR: Could not open the input stream for reading.');
}

// Output it.
header('Content-Type: text/xml');
print $xml->saveXML();

?>
