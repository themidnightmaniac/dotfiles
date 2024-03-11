#/bin/bash
dir=$(pwd)
bpdir="/home/ncho/.scripts/getsf/templates/"
ftype="null"
mset="ms"
author="John Doe"
title="Default Title"
institution="Some University"
css=$dir"script.js"
js=$dir"styles.cs"
mode=2
cfilename="main"
rofffilename="roff"


getBP(){
  
  printf "1)  groff/troff homework\n2)  c basic boilerplate\n";
  printf "choose a filetupe:";
  read number;

  case $number in
    1)
      ftype="roff"; getDIR
      ;;
    2)
      ftype="c"; getDIR
      ;;
    *) 
      printf "Invalid option!"; exit
      ;;
  esac
}

getDIR(){
  printf "Do you want to use the current dir? ($dir) y/n:\n"
  read choice
  while true; do
    case $choice in
      [yY]*)
        cptoDIR; break
      ;;
      [nN]*)
        read -p "Specify the dir you want to use:" customdir;
        dir="$customdir";
        cptoDIR; break
      ;;
      *)
        cptoDIR; break
      ;;
    esac
  done
}

cptoDIR(){
  case $ftype in
    roff)
      printf "What the macro set should be, without the dot? (leave blank for default)\n"
      read msetname 
        if [[ "$msetname" =~ [^$'\n'] ]]; then
        mset=$msetname
      fi
      printf "What the filename, without the extension, should be? (leave blank for default)\n";
      read rofffnchoice;
      if [ -z $rofffnchoice ]; then
        roffFILE
      else
        rofffilename=$rofffnchoice;
        roffFILE
      fi
    ;;
    html)
      cp -i html/file/location $dir$filename
    ;;
    c)
      printf "What the filename without the extension should be? (leave blank for default)\n";
      read cfnchoice;
      if [ -z $cfnchoice ]; then
        cp -i $bpdir"main.c" $dir$cfilename".c"
      else
        cfilename=$cfnchoice;
        cp -i $bpdir"main.c" $dir$cfilename".c"
      fi
    ;;
    null)
      printf "Invalid file type!"; exit
    ;;
  esac
}

roffFILE(){
  printf "1)  Default   (default options specified in the script).\n2)  Advanced  (you set the options).\n\n"; read -p "Choose a mode:" mode;
  case $mode in
    1)
     sed -e "2a $title" -e "3a $author" -e "4a $institution" $bpdir"roff.ms" > $dir$rofffilename"."$mset;
      cp $bpdir"macros" $dir
    ;;
    2)
      read -p "
Title:
" ntitle;
      read -p "
Author:
" nauthor;
      read -p "
Institution:
" ninstitution;
      title=$ntitle;
      author=$nauthor;
      institution=$ninstitution;
      sed -e "2a $title" -e "3a $author" -e "4a $institution" $bpdir"roff.ms" > $dir$rofffilename"."$mset;
      cp $bpdir"macros" $dir
    ;;
    *)
      printf "Invalid mode!"
    ;;
  esac
}

getBP
