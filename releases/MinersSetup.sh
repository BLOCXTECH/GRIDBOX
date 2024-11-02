#!/bin/bash

# Display introductory information to the user
echo "============================================================="
echo "##               Welcome to the Mining Software Setup!      ##"
echo
echo "##           Powered by BLOCX. for the GRIDBOX Mining Template          ##"
echo
echo "Here’s a list of available miners that can be configured with GRIDBOX."
echo "GRIDBOX Mining Template is not limited to these miners; you can configure any mining software of your choice."
echo "We’re working to expand this list to provide more options."
echo "============================================================="
echo

# Function definitions for miner setups
function download_NBMiner() {
    echo "Setting up NBMiner..."
    wget https://github.com/NebuTech/NBMiner/releases/download/v42.3/NBMiner_42.3_Linux.tgz
    tar -xvzf NBMiner_42.3_Linux.tgz
}

function download_TRexMiner() {
    echo "Setting up T-Rex Miner..."
    wget https://github.com/trexminer/T-Rex/releases/download/0.26.8/t-rex-0.26.8-linux.tar.gz
    tar -xvzf t-rex-0.26.8-linux.tar.gz
}

function download_CCMiner() {
    echo "Setting up CCMiner..."
    apt-get update
    apt-get install -y libcurl4
    wget https://github.com/1NF1N18Y/ccminer-Points/releases/download/v0.1-beta/test-release.zip
    unzip test-release.zip
}

function download_RigelMiner() {
    echo "Setting up Rigel Miner..."
    wget https://github.com/rigelminer/rigel/releases/download/1.18.2/rigel-1.18.2-linux.tar.gz
    tar -xvzf rigel-1.18.2-linux.tar.gz
}

function download_LolMiner() {
    echo "Setting up lolMiner..."
    wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.89/lolMiner_v1.89_Lin64.tar.gz
    tar -xvzf lolMiner_v1.89_Lin64.tar.gz
}

# Utility function for CUDA installation
function install_cuda_toolkit() {
    echo "Installing CUDA Toolkit..."
    apt-get update
    apt-get install -y nvidia-cuda-toolkit
}

# Main menu
while true; do
    echo
    echo "================== MAIN MENU =================="
    echo "1) NBMiner"
    echo "2) T-Rex Miner"
    echo "3) CCMiner"
    echo "4) Rigel Miner"
    echo "5) lolMiner"
    echo "6) Utility"
    echo "7) Exit"
    echo
    read -p "Enter the number corresponding to your choice: " choice

    case $choice in
        1)
            download_NBMiner
            ;;
        2)
            download_TRexMiner
            ;;
        3)
            download_CCMiner
            ;;
        4)
            download_RigelMiner
            ;;
        5)
            download_LolMiner
            ;;
        6)
            echo "================== UTILITY OPTIONS =================="
            echo "1) Install CUDA Toolkit (for NVCC support)"
            read -p "Enter your utility choice: " utility_choice
            case $utility_choice in
                1)
                    install_cuda_toolkit
                    ;;
                *)
                    echo "Invalid utility option. Returning to main menu."
                    ;;
            esac
            ;;
        7)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
