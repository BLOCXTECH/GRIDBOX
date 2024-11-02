#!/bin/bash

# Function to update package list
update_package_list() {
    echo "Updating package list..."
    sudo apt-get update
}

# Function to download and extract NBMiner
download_nbminer() {
    echo "Downloading NBMiner..."
    wget https://github.com/NebuTech/NBMiner/releases/download/v42.3/NBMiner_42.3_Linux.tgz

    echo "Extracting NBMiner..."
    tar -xvzf NBMiner_42.3_Linux.tgz

    echo "NBMiner downloaded and extracted successfully."
}

# Function to download and extract T-Rex Miner
download_trex() {
    echo "Downloading T-Rex Miner..."
    wget https://github.com/trexminer/T-Rex/releases/download/0.26.8/t-rex-0.26.8-linux.tar.gz

    echo "Extracting T-Rex Miner..."
    tar -xvzf t-rex-0.26.8-linux.tar.gz

    echo "T-Rex Miner downloaded and extracted successfully."
}

# Function to download and set up CCMiner
setup_ccminer() {
    echo "Installing required package for CCMiner..."
    update_package_list
    sudo apt-get install -y libcurl4

    echo "Downloading CCMiner..."
    wget https://github.com/1NF1N18Y/ccminer-Points/releases/download/v0.1-beta/test-release.zip

    echo "Extracting CCMiner..."
    unzip test-release.zip

    echo "CCMiner downloaded and extracted successfully."
}

# Function to download and extract Rigel Miner
download_rigel() {
    echo "Downloading Rigel Miner..."
    wget https://github.com/rigelminer/rigel/releases/download/1.18.2/rigel-1.18.2-linux.tar.gz

    echo "Extracting Rigel Miner..."
    tar -xvzf rigel-1.18.2-linux.tar.gz

    echo "Rigel Miner downloaded and extracted successfully."
}

# Function to download and extract lolMiner
download_lolminer() {
    echo "Downloading lolMiner..."
    wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.89/lolMiner_v1.89_Lin64.tar.gz

    echo "Extracting lolMiner..."
    tar -xvzf lolMiner_v1.89_Lin64.tar.gz

    echo "lolMiner downloaded and extracted successfully."
}

# Function to install CUDA Toolkit
install_cuda() {
    echo "Installing CUDA Toolkit..."
    update_package_list
    sudo apt-get install -y nvidia-cuda-toolkit
    echo "CUDA Toolkit installed successfully."
}

# Main menu
echo "Which miner do you want to set up?"
echo "1) NBMiner"
echo "2) T-Rex Miner"
echo "3) CCMiner"
echo "4) Rigel Miner"
echo "5) lolMiner"
echo "6) Utility"
echo "7) Exit"

read -p "Enter your choice: " choice

case $choice in
    1)
        download_nbminer
        ;;
    2)
        download_trex
        ;;
    3)
        setup_ccminer
        ;;
    4)
        download_rigel
        ;;
    5)
        download_lolminer
        ;;
    6)
        echo "Utility Options:"
        echo "1) Install Cuda Toolkit (for NVCC support)"
        read -p "Enter your utility choice: " utility_choice
        case $utility_choice in
            1)
                install_cuda
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
