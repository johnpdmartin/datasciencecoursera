#needed to call internet2 to access https urls on WINDOWS OS

setInternet2(TRUE)


#ques 1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/housing.csv")

# file was 4 MB and download meter appeared during execution

list.files("./data")

housing <- read.csv("./data/housing.csv")     #,nrows=5,skip=23)

# it took ~2 secs to read 4 MB (and sort out content/format in the read)

str(housing)

# the R command to output file structure produced a lot of lines since there were 188 variables
#'data.frame':   6496 obs. of  188 variables:
# $ RT      : Factor w/ 1 level "H": 1 1 1 1 1 1 1 1 1 1 ...
# $ SERIALNO: int  186 306 395 506 835 989 1861 2120 2278 2428 ...
# $ DIVISION: int  8 8 8 8 8 8 8 8 8 8 ...
# $ PUMA    : int  700 700 100 700 800 700 700 200 400 500 ...


> table(housing$VAL)

  1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24 
 75  42  33  30  26  29  23  70  99 119 152 199 233 495 483 486 357 502 232 312 164 159  47  53 

# so 53 is the answer to the answer of homes over $1M  , as that is code 24 range

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx?accessType=DOWNLOAD" 

download.file(fileUrl,"./data/Natural_Gas.xlsx")

> list.files("./data")
[1] "cameras.csv"      "housing.csv"      "Natural_Gas.xlsx"

> dateDownloaded <- date()
> dataDownloaded
Error: object 'dataDownloaded' not found
> dateDownloaded
[1] "Fri Aug 22 13:54:26 2014"

library(xlsx)

# failed first time

> install.packages("xlsx")
Installing package into ‘C:/Users/John/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
also installing the dependencies ‘rJava’, ‘xlsxjars’


....

package ‘rJava’ successfully unpacked and MD5 sums checked
package ‘xlsxjars’ successfully unpacked and MD5 sums checked
package ‘xlsx’ successfully unpacked and MD5 sums checked

library(xlsx)

# failed a second time

> library(xlsx)
Loading required package: rJava
Error : .onLoad failed in loadNamespace() for 'rJava', details:
  call: fun(libname, pkgname)
  error: No CurrentVersion entry in Software/JavaSoft registry! Try re-installing Java and make sure R and Java have matching architectures.
Error: package ‘rJava’ could not be loaded

# looked up web and there was discussion that the Java version needed to match R version
# that is 64 bit version since that is what R is in the recent installation I performed
# the java site I tried said I had both 32/64 present so I did download of 64 bit version

# this time library(xlsx) worked!!

> library(xlsx)
Loading required package: rJava

Attaching package: ‘rJava’

The following object is masked from ‘package:RCurl’:

    clone

Loading required package: xlsxjars



NGAPdata <- read.xlsx("./data/Natural_Gas.xlsx",sheetIndex=1,header=TRUE,nrows=18:23)

# didn't work but it appears the file downloaded is corrupted (from web comment and fail to open with excel)

#trying to download as binary

> download.file(fileUrl,"./data/Natural_Gas.xlsx",mode="wb")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx?accessType=DOWNLOAD'
Content type 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' length 16197 bytes (15 Kb)
opened URL

# the file does exist but contains several subtables (viewed in excel)
# will adjust read.xlsx option nrows

NGAPdata <- read.xlsx("./data/Natural_Gas.xlsx",sheetIndex=1,header=TRUE,nrows=6,skip=17)

# syntax is different from read.csv

read.xlsx(file, sheetIndex, sheetName=NULL, rowIndex=NULL,
  startRow=NULL, endRow=NULL, colIndex=NULL,
  as.data.frame=TRUE, header=TRUE, colClasses=NA,
  keepFormulas=FALSE, encoding="unknown", ...)

NGAPdata <- read.xlsx("./data/Natural_Gas.xlsx",sheetIndex=1,header=TRUE,endRow=23,startRow=18,colIndex=c(7:15))

head(NGAPdata)

# finally worked!! read the function spec fully next time

sum(NGAPdata$Zip*NGAPdata$Ext,na.rm=T) 


fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml$?accessType=DOWNLOAD"  
 
> download.file(fileUrl,"./data/rest.xml")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml?accessType=DOWNLOAD'
Content type 'text/xml' length 695658 bytes (679 Kb)
opened URL
downloaded 679 Kb


> list.files("./data")
[1] "~$Natural_Gas.xlsx" "cameras.csv"        "housing.csv"       
[4] "Natural_Gas.xlsx"   "rest.xml"          
> dateDownloaded <- date()
> dateDownloaded
[1] "Sat Aug 23 09:53:22 2014"
> rests <- read.xml("./data/rest.xml")
Error: could not find function "read.xml"
> install.packages("xml")
Installing package into ‘C:/Users/John/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
Warning messages:
1: package ‘xml’ is not available (for R version 3.1.1) 
2: Perhaps you meant ‘XML’ ? 

> install.packages("XML")
Installing package into ‘C:/Users/John/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
trying URL 'http://cran.cs.wwu.edu/bin/windows/contrib/3.1/XML_3.98-1.1.zip'
Content type 'application/zip' length 4288428 bytes (4.1 Mb)
opened URL
downloaded 4.1 Mb

package ‘XML’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\John\AppData\Local\Temp\Rtmp0SnrsR\downloaded_packages
> library()
> rests <- read.xml("./data/rest.xml")
Error: could not find function "read.xml"
> library("xml")
Error in library("xml") : there is no package called ‘xml’
> library("XML")
> rests <- read.XML("./data/rest.xml")
Error: could not find function "read.XML"
> rests <- read.xml("./data/rest.xml")
Error: could not find function "read.xml"
> library()
> rests <- xmlTreeParse("./data/rest.xml",useInternal=TRUE)

downloaded 15 Kb



head(rests)

> rootNode[[1]]
#gave whole file

> rootNode[[1]][[1]]
<row _id="1" _uuid="93CACF6F-C8C2-4B87-95A8-8177806D5A6F" _position="1" _address="http://data.baltimorecity.gov/resource/k5ry-ef3g/1">
  <name>410</name>
  <zipcode>21206</zipcode>
  <neighborhood>Frankford</neighborhood>
  <councildistrict>2</councildistrict>
  <policedistrict>NORTHEASTERN</policedistrict>
  <location_1 human_address="{&quot;address&quot;:&quot;4509 BELAIR ROAD&quot;,&quot;city&quot;:&quot;Baltimore&quot;,&quot;state&quot;:&quot;MD&quot;,&quot;zip&quot;:&quot;&quot;}" needs_recoding="true"/>
</row> 


> zip <- xpathSApply(rootNode,"//zipcode",xmlValue)
> length(zip)
[1] 1327

> table(zip)
zip
-21226  21201  21202  21205  21206  21207  21208  21209  21210  21211  21212 
     1    136    201     27     30      4      1      8     23     41     28 
 21213  21214  21215  21216  21217  21218  21220  21222  21223  21224  21225 
    31     17     54     10     32     69      1      7     56    199     19 
 21226  21227  21229  21230  21231  21234  21237  21239  21251  21287 
    18      4     13    156    127      7      1      3      2      1 


https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/acs_idaho.csv")

> download.file(fileUrl,destfile="./data/acs_idaho.csv")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv?accessType=DOWNLOAD'
Content type 'text/csv' length 11462469 bytes (10.9 Mb)
opened URL
downloaded 10.9 Mb

list.files("./data")

acs <- read.csv("./data/acs_idaho.csv")     
# taking too long so aborted read. I was meant to use data.table technique

> install.packages("data.table")
Installing package into ‘C:/Users/John/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
also installing the dependencies ‘plyr’, ‘Rcpp’, ‘reshape2’

...

> library(data.table)
data.table 1.9.2  For help type: help("data.table")

system.time(df <- fread("./data/acs_idaho.csv"))


ucscDb <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);

hg19 <- dbConnect(MySQL(),user="genome",db="hg19", host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)

allTables[1:15]

> allTables[1:15]
 [1] "HInv"                      "HInvGeneMrna"             
 [3] "acembly"                   "acemblyClass"             
 [5] "acemblyPep"                "affyCytoScan"             
 [7] "affyExonProbeAmbiguous"    "affyExonProbeCore"        
 [9] "affyExonProbeExtended"     "affyExonProbeFree"        
[11] "affyExonProbeFull"         "affyExonProbesetAmbiguous"
[13] "affyExonProbesetCore"      "affyExonProbesetExtended" 
[15] "affyExonProbesetFree"     
> dbListFields(hg19,"affyU133Plus2")
Error in mysqlExecStatement(conn, statement, ...) : 
  RS-DBI driver: (could not run statement: MySQL server has gone away)
> hg19 <- dbConnect(MySQL(),user="genome",db="hg19", host="genome-mysql.cse.ucsc.edu")
> allTables <- dbListTables(hg19)
> dbListFields(hg19,"affyU133Plus2")
 [1] "bin"         "matches"     "misMatches"  "repMatches"  "nCount"     
 [6] "qNumInsert"  "qBaseInsert" "tNumInsert"  "tBaseInsert" "strand"     
[11] "qName"       "qSize"       "qStart"      "qEnd"        "tName"      
[16] "tSize"       "tStart"      "tEnd"        "blockCount"  "blockSizes" 
[21] "qStarts"     "tStarts"    
> dbGetQuery(hg19,"select count(*) from affyU133Plus")
Error in mysqlExecStatement(conn, statement, ...) : 
  RS-DBI driver: (could not run statement: Table 'hg19.affyU133Plus' doesn't exist)
> dbGetQuery(hg19,"select count(*) from affyU133Plus2")
  count(*)
1    58463


source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")

library(rhdf5)
created = h5createFile("example.h5")
created



