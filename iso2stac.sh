for file in ./bulk/*.xml; do
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    filename="${filename%.*}"
    node node_modules/xslt3/xslt3.js "-s:$file" "-xsl:src/iso2stac.xsl" "-o:xslt-out/${filename}.json"
done
