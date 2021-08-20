
#!/bin/sh

flashNoraml()
{
<<<<<<< HEAD
=======
	adb -s $1 reboot bootloader
>>>>>>> 7e6324ba1bcbeeff0e19ef5c4e9ad495f68b01d9
	sleep 5
	echo "Prepare to flash image for fastboot mode"
	fastboot -s $1 erase devinfo
	fastboot -s $1 reboot bootloader
	fastboot -s $1 flash sbl1 sbl1.mbn
	fastboot -s $1 flash sbl1bak sbl1.mbn
	fastboot -s $1 flash aboot emmc_appsboot.mbn
	fastboot -s $1 flash abootbak emmc_appsboot.mbn
	fastboot -s $1 erase userdata
	fastboot -s $1 reboot bootloader
	fastboot -s $1 flash partition gpt_both0.bin
	fastboot -s $1 reboot bootloader
	fastboot -s $1 flash sbl1 sbl1.mbn
	fastboot -s $1 flash sbl1bak sbl1.mbn
	fastboot -s $1 flash aboot emmc_appsboot.mbn
	fastboot -s $1 flash abootbak emmc_appsboot.mbn
	fastboot -s $1 flash devcfg devcfg.mbn
	fastboot -s $1 flash dtbo dtbo.img
	fastboot -s $1 flash dtbobak dtbo.img
	fastboot -s $1 flash vbmeta vbmeta.img
	fastboot -s $1 flash vbmetabak vbmeta.img
	fastboot -s $1 flash boot boot.img
	fastboot -s $1 flash recovery recovery.img
	fastboot -s $1 flash system system.img
	fastboot -s $1 flash vendor vendor.img
	fastboot -s $1 flash mdtp mdtp.img
	fastboot -s $1 flash cache cache.img
	fastboot -s $1 flash splash splash.img
	fastboot -s $1 erase userdata
	fastboot -s $1 erase cache
	fastboot -s $1 erase misc
	fastboot -s $1 erase devinfo
	echo "Finished"
	fastboot -s $1 reboot
}


flashABpart()
{
<<<<<<< HEAD
=======
	adb -s $1 reboot bootloader
>>>>>>> 7e6324ba1bcbeeff0e19ef5c4e9ad495f68b01d9
	sleep 5
	echo "Prepare to flash image for fastboot -s $1 mode"
	fastboot -s $1 devices
	fastboot -s $1 erase devinfo
	fastboot -s $1 reboot bootloader
	fastboot -s $1 flash sbl1 sbl1.mbn
	fastboot -s $1 flash sbl1bak sbl1.mbn
	fastboot -s $1 flash aboot emmc_appsboot.mbn
	fastboot -s $1 flash abootbak emmc_appsboot.mbn
	fastboot -s $1 erase userdata
	fastboot -s $1 reboot bootloader
	fastboot -s $1 flash partition gpt_both0.bin
	fastboot -s $1 reboot bootloader
	fastboot -s $1 flash sbl1 sbl1.mbn
	fastboot -s $1 flash sbl1bak sbl1.mbn
	fastboot -s $1 flash aboot emmc_appsboot.mbn
	fastboot -s $1 flash abootbak emmc_appsboot.mbn
	fastboot -s $1 flash devcfg devcfg.mbn
	fastboot -s $1 flash dtbo dtbo.img
	fastboot -s $1 flash dtbobak dtbo.img
	fastboot -s $1 flash boot boot.img
	fastboot -s $1 flash vbmeta vbmeta.img
	fastboot -s $1 flash vbmetabak vbmeta.img
	fastboot -s $1 flash vbmeta_system vbmeta_system.img
	fastboot -s $1 flash recovery recovery.img
	fastboot -s $1 flash -S 500M super super.img
	fastboot -s $1 flash mdtp mdtp.img
	fastboot -s $1 flash cache cache.img
	fastboot -s $1 flash splash splash.img
	fastboot -s $1 erase userdata
	fastboot -s $1 erase cache
	fastboot -s $1 erase misc
	fastboot -s $1 erase devinfo
	echo "Finished"
        fastboot -s $1 reboot
}


flashAOSP()
{
<<<<<<< HEAD
=======
	adb -s $1 reboot bootloader
>>>>>>> 7e6324ba1bcbeeff0e19ef5c4e9ad495f68b01d9
	sleep 5
	echo "fastboot flashing GSI img"
	fastboot -s $1 erase userdata
        fastboot -s $1 reboot-bootloader
        fastboot -s $1 devices
        fastboot -s $1 reboot-bootloader
        fastboot -s $1 devices

        fastboot -s $1 --disable-verification flash vbmeta vbmeta.img
        fastboot -s $1 erase system
        fastboot -s $1 flash system system.img
        fastboot -s $1 erase userdata
        fastboot -s $1 erase cache

	echo "Finished"
	fastboot -s $1 reboot
}



###
# Main function body
###
cd $1
if [[ "$(ls)" == *"super_empty.img"* ]]; then
	echo "AOSP"
	mode=false
else
<<<<<<< HEAD
=======
	echo "Normal flash"
>>>>>>> 7e6324ba1bcbeeff0e19ef5c4e9ad495f68b01d9
	if [[ "$(ls)" == *"vbmeta_system.img"* ]]; then
		ABpart=true
	else
		ABpart=false
	fi
	mode=true
	# if true, normal flashing would be perform
fi

serialNum=()
serialNum+=("$(echo $(adb devices) | cut -d" " -f 5)")
serialNum+=("$(echo $(adb devices) | cut -d" " -f 7)")
serialNum+=("$(echo $(adb devices) | cut -d" " -f 9)")
<<<<<<< HEAD
serialNum+=("$(echo $(adb devices) | cut -d" " -f 11)")

for num in `seq 0 3`
do
{
	if [ "${serialNum[num]}" != "" ] ; then
		adb -s ${serialNum[num]} reboot bootloader
	fi
} &
done
wait
unset serailNum
echo "Waitting device reboot for 10 second!!!"
sleep 5
echo "Waitting device reboot for 5 second!!!"
sleep 5



serialNum=()
if [ "$(echo $(adb devices) | cut -d" " -f 5)" == ""  ] ; then
        echo "Trying to search fastboot devices!!!"
	serialNum+=("$(echo $(fastboot devices) | cut -d" " -f 1)")
	serialNum+=("$(echo $(fastboot devices) | cut -d" " -f 3)")
	serialNum+=("$(echo $(fastboot devices) | cut -d" " -f 5)")
	serialNum+=("$(echo $(fastboot devices) | cut -d" " -f 7)")
fi

a=$(date +%H:%M:%S)

for num in `seq 0 3`
=======

a=$(date +%H%M%S)

for num in `seq 0 2`
>>>>>>> 7e6324ba1bcbeeff0e19ef5c4e9ad495f68b01d9
do
{
	if [ "${serialNum[num]}" != "" ] ; then
		echo "Start flashing ${serialNum[num]}"
		if $mode ; then
			echo "Normal img flashing..."
			if $ABpart ; then
				echo "AB partition flash mode"
				flashABpart ${serialNum[num]}
			else
				echo "No AB partition"
				flashNoraml ${serialNum[num]}
			fi
		else
			echo "AOSP flashing..."
			flashAOSP ${serialNum[num]}
		fi
	fi
} &
done

wait

<<<<<<< HEAD
b=$(date +%H:%M:%S)
=======
b=$(date +%H%M%S)
>>>>>>> 7e6324ba1bcbeeff0e19ef5c4e9ad495f68b01d9

echo -e "Start:\t$a"
echo -e "End:\t$b"

