# ScienceFair
This repo contains the core MATLAB code written for my 2020 INSPO and YSC science fair project titled "Detecting Tinnitus: GPIAS relationships with hearing in mice."

This code efficiently processed a large set of collected data, and was responsible for the automated extraction of all three ASR features for further analysis in MATLAB and Excel.

The collected data was organized into 5 folders, each of which contained four subfolders, and each subfolder contained ~15 .dam files which each stored the data for one ASR waveform. The "peak2peak.m" script in this repo iterates through each folder, subfolder and .dam file to process and clean waveforms, and to calculate peak-to-peak amplitude. Running this script extracts the peak-to-peak amplitude for every single waveform (~300 waveforms) and sends it to organized, designated sheets in Excel. 

The other two scripts, "duration.m" and "latency.m," demonstrate the extraction of ASR duration and latency features for a singular ASR waveform (i.e. one file). The iterative process of extracting from all waveforms at once was already demonstrated in the "peak2peak.m" script, and so was stripped from the code for these two features for better readability.

MATLAB was used to plot and draw figures, but that code is not included here. 

All code in this repo is self-written and third party functions used are not included. 



