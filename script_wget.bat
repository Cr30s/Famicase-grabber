REM **********************************************************************************************
REM *********************************** FAMICASE GRABBER *****************************************
REM **********************************************************************************************
REM * V1.0	2017-05-11	Creation																 *
REM **********************************************************************************************
REM * Context : 																				 *
REM * Each year the famicase contest allows contestants to create original cartdrige	 		 *
REM * covers for non existing games using famicom cart format. Following this first contest a 	 *
REM * second one takes place :  A Game By Its Cover. For this second one I needed the arts.		 *
REM *																							 *
REM * Why this script ? 																		 *
REM * The famicase website is a bit slow and it's not easy to peruse all the covers at once.	 *
REM * So I initially created this poorly written script to grab all covers from the website into *
REM * a local folder. Then I decded to get the html files too as some artists had an idea about	 *
REM * what type of game the art should illustrate and describe it in the html file. 			 *
REM * Unfortunately the description text was'nt displayed because of the lack of css. 			 *
REM * As I am lazy I just altered the batch to grab the index file and everything it needs to    *
REM * display proper data.							 											 *
REM * Hilariously doing so mixed up the so wanted covers with thumbs, artist pp and such :sic:	 *
REM * So I ended up creating a new folder Famicases which only contains the covers. Pfiou !		 *
REM **********************************************************************************************

@echo off
setlocal enableDelayedExpansion

REM parameters
set /a yearvar = 17
set /a numberEntries = 166	REM = actual entries number + 1

REM Main
cls
mkdir Famicases
mkdir website

REM get main site files (as famicase.com does not allow wget - A we have to specify each file :'()
wget-1.11.4-1-bin\bin\wget.exe -P website\%yearvar% http://famicase.com/%yearvar%/index.html
wget-1.11.4-1-bin\bin\wget.exe -P website\js http://famicase.com/js/jquery-1.7.2.min.js
wget-1.11.4-1-bin\bin\wget.exe -P website\js http://famicase.com/js/opacity-rollover2.1.js

wget-1.11.4-1-bin\bin\wget.exe -P website\css http://famicase.com/css/import.css
wget-1.11.4-1-bin\bin\wget.exe -P website\css http://famicase.com/css/lightbox.css
wget-1.11.4-1-bin\bin\wget.exe -P website\css http://famicase.com/css/window.css
wget-1.11.4-1-bin\bin\wget.exe -P website\css http://famicase.com/css/default.css
wget-1.11.4-1-bin\bin\wget.exe -P website\css http://famicase.com/css/style.css
wget-1.11.4-1-bin\bin\wget.exe -P website\css http://famicase.com/css/print.css
wget-1.11.4-1-bin\bin\wget.exe -P website\css http://famicase.com/css/page.css

wget-1.11.4-1-bin\bin\wget.exe -P website\fancybox http://famicase.com/fancybox/jquery.mousewheel-3.0.4.pack.js
wget-1.11.4-1-bin\bin\wget.exe -P website\fancybox http://famicase.com/fancybox/jquery.fancybox-1.3.4.pack.js
wget-1.11.4-1-bin\bin\wget.exe -P website\fancybox http://famicase.com/fancybox/jquery.fancybox-1.3.4.css
wget-1.11.4-1-bin\bin\wget.exe -P website\fancybox http://famicase.com/fancybox/fancybox.png
wget-1.11.4-1-bin\bin\wget.exe -P website\fancybox http://famicase.com/fancybox/fancybox-x.png
wget-1.11.4-1-bin\bin\wget.exe -P website\fancybox http://famicase.com/fancybox/fancybox-y.png
wget-1.11.4-1-bin\bin\wget.exe -P website\fancybox http://famicase.com/fancybox/blank.gif

wget-1.11.4-1-bin\bin\wget.exe -P website\%yearvar%\img http://famicase.com/17/img/back_2017.jpg
wget-1.11.4-1-bin\bin\wget.exe -P website\%yearvar%\img http://famicase.com/17/img/Famiten17_title.jpg

REM get contest entries
FOR /l %%N in (1,1,%numberEntries%) do (
    set "n=00%%N"
    set "formatedNumber=!n:~-3!"
wget-1.11.4-1-bin\bin\wget.exe -P website\%yearvar%\softs http://famicase.com/%yearvar%/softs/!formatedNumber!.jpg
wget-1.11.4-1-bin\bin\wget.exe -P website\%yearvar%\softs http://famicase.com/%yearvar%/softs/!formatedNumber!_i.jpg
wget-1.11.4-1-bin\bin\wget.exe -P website\%yearvar%\softs http://famicase.com/%yearvar%/softs/!formatedNumber!.gif
wget-1.11.4-1-bin\bin\wget.exe -P website\%yearvar%\softs http://famicase.com/%yearvar%/softs/!formatedNumber!.html
copy website\%yearvar%\softs\!formatedNumber!.jpg Famicases
)

REM Open local webiste index
start website\%yearvar%\index.html