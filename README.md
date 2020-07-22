# ScienceFair
This repo contains MATLAB code written for my 2020 INSPO and YSC science fair project titled "Detecting Tinnitus: GPIAS relationships with hearing in mice."
This code efficiently processed an extremely large set of collected data, and was responsible for the extraction of all three ASR features for further analysis in MATLAB and Excel.

The collected data was organized into 5 folders, each of which contained four subfolders, and each subfolder contained ~15 .dam files which each stored the data for one ASR waveform. The "peak2peak.m" script in this repo iterates through each folder, subfolder and .dam file to process and clean waveforms, and to calculate peak-to-peak amplitude. Running this script extracts the peak-to-peak amplitude for every single waveform (~300 waveforms) and sends it to designated sheets in Excel. 

The other two scripts, "duration.m" and "latency.m," demonstrate the extraction of ASR duration and latency features for a singular ASR waveform, as the iterative process of extracting a feature from all waveforms at once was already demonstrated in the "peak2peak.m" script, and used identical code when the data was processed.

All code in this repo is self-written and third party functions used are not included. 



