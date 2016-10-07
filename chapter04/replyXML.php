<?php

$xml = '';
$basedir = dirname(__FILE__);
$xmlfile = $basedir . DIRECTORY_SEPARATOR . 'login.xml';

$xml_parser = xml_parser_create();

// get the contents of the raw POST data
$xml = file_get_contents('php://input');

if ($xml !== false) {
    if (!xml_parse($xml_parser, $xml)) {
        // Generate the XML Error message to return
        $return = sprintf("XML Error: %s at line %d",
            xml_error_string(xml_get_error_code($xml_parser)),
            xml_get_current_line_number($xml_parser)
            );
    }
    else {
        // Check if $xmlfile is writeable
        if ( (file_exists($xmlfile) && is_writeable($xmlfile)) || is_writeable($basedir) ) {
            // Try to write the file
            $xmlwrite = file_put_contents($xmlfile, $xml);
            if ($xmlwrite === false) {
                // Could not write the file
                $return = 'ERROR: Could not write to ' . $xmlfile;
            }
            else {
                // everything okay.
                $return = 'Success: The ' . $xmlfile . ' has been successfully saved.';
            }
        }
        else {
            // $xmlfile isnt writeable
            $return = 'ERROR: The specified file, ' . $xmlfile . ', is not writeable.';
        }
    }
}
else {
    $return = 'ERROR: Could not open the input stream for reading.';
}

// Free up the xmlparser/memory
xml_parser_free($xml_parser);

// Generate the return message
$out = '<message>' . $return . '</message>';
$doc = DOMDocument::loadXML($out);

// Output it.
header('Content-Type: text/xml');
print $doc->saveXML();

?>
