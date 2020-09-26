echo Please drag and drop the jpg here, then press ENTER.
read $file
#echo What is the name for this work?
#read $name
#TODO: strip GPS location etc.?
sips -Z 320 $file -o /tmp/thumb
data=`base64 $file`
thumb=`base64 /tmp/thumb`
echo TODO, Convert this to python script, maybe with GUI.
echo Add this to works.xml:
echo
echo "<work>"
echo "<type>watercolor</type>"
echo "<name>$name</name>"
echo "<date>`date`</date>"
echo "<data>$data</data>"
echo "<thumb></thumb>"
echo "</work>"
