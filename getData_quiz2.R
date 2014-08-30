library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
#myapp <- oauth_app("github", "05ebf07ffc2c53cecd29")
#correct version by adding client secret id option to the call
 myapp <- oauth_app("github", "05ebf07ffc2c53cecd29","93349b5c3d09542f4fb3c57e405a359004f72c5e")


# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)


#got a warning so installed httpuv package

> github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
Use a local file to cache OAuth access credentials between R sessions?
1: Yes
2: No

Selection: Yes
Adding .httr-oauth to .gitignore
Error in authorizer(authorize_url, is_interactive) : 
  httpuv package required to capture OAuth credentials.
> install.packages("httpuv")
Installing package into ‘C:/Users/John/Documents/R/win-library/3.1’
(as ‘lib’ is unspecified)
trying URL 'http://cran.fhcrc.org/bin/windows/contrib/3.1/httpuv_1.3.0.zip'
Content type 'application/zip' length 857663 bytes (837 Kb)
opened URL
downloaded 837 Kb

package ‘httpuv’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\John\AppData\Local\Temp\RtmpsZAJj4\downloaded_packages

# finally ran it right
> github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
Waiting for authentication in browser...
Press Esc/Ctrl + C to abort
Authentication complete.

> github_token
<Token>
<oauth_endpoint>
 authorize: https://github.com/login/oauth/authorize
 access:    https://github.com/login/oauth/access_token
<oauth_app> github
  key:    05ebf07ffc2c53cecd29
  secret: <hidden>
<credentials> access_token, scope, token_type
---



# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

#lots of output, in particular for datasharing repo


[[5]]$releases_url
[1] "https://api.github.com/repos/jtleek/datasharing/releases{/id}"

[[5]]$created_at
[1] "2013-11-07T13:25:07Z"


#ques 2
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv?accessType=DOWNLOAD"
setInternet2(TRUE)
download.file(fileUrl,destfile="./data/acs_2.csv")
list.files("./data")
acs <- read.csv("./data/acs_2.csv")
str(acs)


#needed a few goes

> getwd()
[1] "C:/Users/John/Documents"
> setwd("../Desktop/courses/datasciencecoursera")
> getwd()
[1] "C:/Users/John/Desktop/courses/datasciencecoursera"
> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv?accessType=DOWNLOAD"
> setInternet2(TRUE)
> download.file(fileUrl,destfile="./data/acs_2.csv")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv?accessType=DOWNLOAD'
Content type 'text/csv' length 11462469 bytes (10.9 Mb)
opened URL
downloaded 10.9 Mb

> acs <- read.csv("./data/acs_2.csv")
> str(acs)
'data.frame':   14931 obs. of  239 variables:
 $ RT      : Factor w/ 1 level "P": 1 1 1 1 1 1 1 1 1 1 ...
 $ SERIALNO: int  186 186 186 186 306 395 395 506 506 506 ...
 $ SPORDER : int  1 2 3 4 1 1 2 1 2 3 ...
 $ PUMA    : int  700 700 700 700 700 100 100 700 700 700 ...

install.packages("sqldf") 
library("sqldf")
options(sqldf.driver = "SQLite") # issues with RMySQL

> head(sqldf("select PWGTP,pwgtp1,pwgtp80 from acs where AGEP < 50"))
  PWGTP pwgtp1 pwgtp80
1    89     87     129
2    92     88     131
3   107     94     156
4    91     91     138
5   309    539     259
6   108    192      31
> library(XML)
> url <- "http://biostat.jhsph.edu/~jleek/contact.html" 
> html <- htmlTreeParse(url,useInternalNodes=T)
> rootNode[[1]][[1]]
Error: object 'rootNode' not found
> html[[1]][[1]]
Error in `[.XMLInternalDocument`(x, i, addFinalizer = addFinalizer) : 
  No method for subsetting an XMLInternalDocument with numeric
> head(html)
Error in `[.XMLInternalDocument`(x, seq_len(n)) : 
  No method for subsetting an XMLInternalDocument with integer
> html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta name="Description" content="Welcome to Jeff Leek's Research Group">
...


> htmlCode = readLines(url)
> htmlCode = readLines(url,10)
> htmlCode
 [1] "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">"                                                                                                                                                  
 [2] ""                                                                                                                                                                                                                                                                   
 [3] "<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">"                                                                                                                                                                                          
 [4] ""                                                                                                                                                                                                                                                                   
 [5] "<head>"                                                                                                                                                                                                                                                             
 [6] ""                                                                                                                                                                                                                                                                   
 [7] "<meta name=\"Description\" content=\"Welcome to Jeff Leek's Research Group\" />"                                                                                                                                                                                    
 [8] "<meta name=\"Keywords\" content=\"Johns Hopkins University, Bloomberg School of Public Health, Biostatistics, Surrogate Variable Analysis, sva, expression heterogeneity, clinical genomics, reproducibility, high-dimensional data, Top Scoring Pair, tspair \" />"
 [9] "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />"                                                                                                                                                                                     
[10] "<meta name=\"Distribution\" content=\"Global\" />"                                                                                                                                                                                                                  
> htmlCode = readLines(url)
> nchar(htmlCode[10])
[1] 45
> nchar(htmlCode[20])
[1] 31
> nchar(htmlCode[30])
[1] 7
> nchar(htmlCode[100])
[1] 25

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for" 

> ht2 <- read.fwf(file=url,width=c(28,4),sep=":",as.is=FALSE,skip=4)
> head(ht2)
                            V1   V2
1  03JAN1990     23.4-0.4      25.1
2  10JAN1990     23.4-0.8      25.2
3  17JAN1990     24.2-0.3      25.3
4  24JAN1990     24.4-0.5      25.5
5  31JAN1990     25.1-0.2      25.8
6  07FEB1990     25.8 0.2      26.1
> df <- as.vector(ht2$V2)
> sum(df)
[1] 32426.7
> 


