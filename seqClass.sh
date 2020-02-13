#!/bin/bash
#grab the first argument
seq=$1
#make the first arg all in upper case
seq=$(echo $seq | tr a-z A-Z)
#if it contains any base, then continue the loop
if [[ $seq =~ ^[ACGTU]+$ ]]; then
#if the seq has a T in it, then it is DNA
  if [[ $seq =~ T ]]; then
    echo "The sequence is DNA"
#if the seq has a U in it, then it is RNA
  elif [[ $seq =~ U ]]; then
    echo "The sequence is RNA"
#if it has not any T or U, the sequence can be DNA or RNA
  else
    echo "The sequence can be DNA or RNA"
  fi
#if the seq has not any base, it is not DNA nor RNA
else
  echo "The sequence is not DNA nor RNA"
fi
#we get the second arg as the motif and make it upper case
motif=$(echo $2 | tr a-z A-Z)
#if we have motif, then print as follows
if [[ -n $motif ]]; then
  echo -en "Motif search enabled: looking for motif '$motif' in sequence '$seq'... "
#if motif is found, print FOUND if not, print not found
  if [[ $seq =~ $motif ]]; then
    echo "FOUND"
  else
    echo "NOT FOUND"
  fi
fi
#end of the sript
