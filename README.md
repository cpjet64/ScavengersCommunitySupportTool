!!IF YOU ARE HERE FROM THE SCAVENGERS DISCORD DO NOT USE THIS TESTING AND DEVELOPEMENT VERSION!!

# ScavengersCommunitySupportTool

This software is free and open source. If you have any questions please contact Cpjet64#5663 via Discord.

Download the latest release from https://github.com/cpjet64/ScavengersUE4SupportTool/releases

To use this tool, save all files DIRECTLY into your Downloads folder.  
Right click the ScavengersCST.exe, click Properties, and check off "Unblock" as shown below, then click Apply.  
After that, run the ScavengersCST.exe file and click the function you were told to select.  
Once you select a function you will be presented with a User Account Control (UAC) popup asking if you want to allow the program to make changes to your computer.  
Make sure to select YES.  
The tool will now start running several included with Windows repair tools and then download and install the latest DirectX and Visual C++ Redistributables.  

While the tool is running the buttons will grey out to prevent you from clicking on them but please make sure NOT TO touch your keyboard or click anything with your mouse.

This tool will create the following files on your computer:  
(These files are created and deleted automatically)  
C:\Users\YOURUSERNAME\AppData\Local\Temp\SCSTInfo.log (This file contains the PC information)  
C:\Users\YOURUSERNAME\AppData\Local\Temp\SCSTRepair.log (This file containts the PC information and the repair tool logs)  
C:\Users\YOURUSERNAME\AppData\Local\Temp\SCSTDiscord.txt (This file contains the Discord username you were prompted to enter when you selected Data Collector or Repair)  

This tool will download and install the following files on your computer:  
(Not including the parts of Windows that will be automatically installed by Windows to allow you to run the tool)  
(The downloaded installers will be deleted automatically once they are done runnning)  
DirectX Redistributable from Microsoft @ https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe  
VisualC++ 32Bit x86 Redistributable from Microsoft @ https://aka.ms/vs/16/release/vc_redist.x86.exe  
VisualC++ 64bit x64 Redistributable from Microsoft @ https://aka.ms/vs/16/release/vc_redist.x64.exe

PRIVACY WARNING

This tool will collect the following data and transmit it automatically upon completion of running either the Data Collector or Repair functions.   
This data will be transmitted via Discord to the Developers and Support Team of Scavengers Game.   
This data will be used to assist with troubleshooting and repairing PC issues.   
If you would like to request a copy of the data transmitted please contact one of the  
Moderation Staff in the Official Discord of Scavengers and provide the Discord username you used when the tool requested it.

Data collected:  
CPU - Name, MaxClockSpeed, SocketDesignation, Manufacturer  
GPU - Name, CurrentHorizontalResolution, CurrentVerticalResolution, CurrentRefreshRate, AdapterRam, DriverDate, DriverVersion  
RAM/MEMORY - Manufacturer, PartNumber, Speed, DeviceLocator  
Disk Drive - DeviceID, Model (To translate, this collects the model number and which physical drive it is)  
Logial Disk/Partition - DeviceID (To translate, this collects the partitions for example the C:\ drive or the D:\ drive and how many GB the size is)  
SFC Tool Logfile - This tool collates the repair information from the CBS.log file which is generated when the SFC Tool is run  
DISM Tool Logfile - This tool collates the repair information from the custom DISM logfile which is generated when the DISM Tool is run  
