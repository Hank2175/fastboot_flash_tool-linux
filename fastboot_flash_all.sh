#!/bin/sh
flashPhaeton(){
	sleep 5
	echo "Prepare to flash image for fastboot mode"
	fastboot -s $1 flash partition gpt_both0.bin
	fastboot -s $1 flash xbl_a xbl.elf
	fastboot -s $1 flash xbl_b xbl.elf
	fastboot -s $1 flash xbl_config_a xbl_config.elf
	fastboot -s $1 flash xbl_config_b xbl_config.elf
	fastboot -s $1 flash tz_a tz.mbn
	fastboot -s $1 flash tz_b tz.mbn
	fastboot -s $1 flash rpm_a rpm.mbn
	fastboot -s $1 flash rpm_b rpm.mbn
	fastboot -s $1 flash hyp_a hyp.mbn
	fastboot -s $1 flash hyp_b hyp.mbn
	fastboot -s $1 flash keymaster_a km41.mbn
	fastboot -s $1 flash keymaster_b km41.mbn
	fastboot -s $1 flash modem_a NON-HLOS.bin
	fastboot -s $1 flash modem_b NON-HLOS.bin
	fastboot -s $1 flash dsp_a dspso.bin
	fastboot -s $1 flash dsp_b dspso.bin
	fastboot -s $1 flash devcfg_a devcfg.mbn
	fastboot -s $1 flash devcfg_b devcfg.mbn
	fastboot -s $1 flash qupfw_a qupv3fw.elf
	fastboot -s $1 flash qupfw_b qupv3fw.elf
        fastboot -s $1 flash featenabler_a featenabler.mbn
        fastboot -s $1 flash featenabler_b featenabler.mbn
        fastboot -s $1 flash bluetooth_a BTFM.bin
        fastboot -s $1 flash bluetooth_b BTFM.bin
        fastboot -s $1 flash logfs logfs_ufs_8mb.bin
        fastboot -s $1 flash storsec storsec.mbn
        fastboot -s $1 flash multiimgoem_a multi_image.mbn
        fastboot -s $1 flash multiimgoem_b multi_image.mbn
        fastboot -s $1 flash imagefv_a imagefv.elf
        fastboot -s $1 flash imagefv_b imagefv.elf
        fastboot -s $1 flash uefisecapp_a uefi_sec.mbn
        fastboot -s $1 flash uefisecapp_b uefi_sec.mbn
        fastboot -s $1 flash devinfo devinfo
        fastboot -s $1 flash abl_a abl.elf
        fastboot -s $1 flash abl_b abl.elf
        fastboot -s $1 flash boot_a boot.img
        fastboot -s $1 flash boot_b boot.img
        fastboot -s $1 flash dtbo_a dtbo.img
        fastboot -s $1 flash dtbo_b dtbo.img
        fastboot -s $1 flash super super.img
        fastboot -s $1 flash vbmeta_system_a vbmeta_system.img
        fastboot -s $1 flash vbmeta_system_b vbmeta_system.img
        fastboot -s $1 flash metadata metadata.img
        fastboot -s $1 flash recovery_a recovery.img
        fastboot -s $1 flash recovery_b recovery.img
        fastboot -s $1 flash vbmeta_a vbmeta.img
        fastboot -s $1 flash vbmeta_b vbmeta.img
        fastboot -s $1 erase misc
        fastboot -s $1 erase userdata
	fastboot -s $1 erase reserved
        fastboot -s $1 erase oem
	sleep 5
	echo "Finished"
        fastboot -s $1 reboot
}
flashNoraml()
{
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
	fastboot -s $1 flash -S 100M system system.img
	fastboot -s $1 flash -S 100M vendor vendor.img
	fastboot -s $1 flash mdtp mdtp.img
	fastboot -s $1 flash cache cache.img
	fastboot -s $1 flash splash splash.img
	fastboot -s $1 erase userdata
	fastboot -s $1 erase cache
	fastboot -s $1 erase misc
	fastboot -s $1 erase devinfo
	fastboot -s $1 erase reserved
        fastboot -s $1 erase oem
	echo "Finished"
	fastboot -s $1 reboot
}


flashABpart()
{
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
	fastboot -s $1 erase reserved
	fastboot -s $1 erase oem
	echo "Finished"
        fastboot -s $1 reboot
}


flashAOSP()
{
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

_Model=0
until [ $_Model -le 7 ] && [ $_Model -ge 1 ]
do
	echo "Please select device to flash!!!"
	echo "1. Hera_Pro"
	echo "2. Chiron_Pro"
	echo "3. Triton"
	echo "4. Surfing_Pro"
	echo "5. Kiosk"	
	echo "6. CDR"
	echo "7. Phaeton"
	read _Model
done



Device=""
if [[ $_Model -eq 1 ]] ; then
	Device="N672"
elif [[ $_Model -eq 2 ]] ; then
	Device="N635"
elif [[ $_Model -eq 3 ]] ; then
	Device="PRO 8475"
elif [[ $_Model -eq 4 ]] ; then
	Device="N630"
elif [[ $_Model -eq 5 ]] ; then
        Device="Kiosk"
elif [[ $_Model -eq 6 ]] ; then
	Device="CDR"
elif [[ $_Model -eq 7 ]] ; then
	Device="N722"
fi

#if [[ "$(ls)" == *"super_empty.img"* ]]; then
#	echo "AOSP"
#	mode=false
#else
	echo "Normal flash"
	if [[ "$(ls)" == *"vbmeta_system.img"* ]]; then
		ABpart=true
	else
		ABpart=false
	fi
	mode=true
	# if true, normal flashing would be perform
#fi

serialNum=()
serialNum+=("$(echo $(adb devices) | cut -d" " -f 5)")
serialNum+=("$(echo $(adb devices) | cut -d" " -f 7)")
serialNum+=("$(echo $(adb devices) | cut -d" " -f 9)")
serialNum+=("$(echo $(adb devices) | cut -d" " -f 11)")
serialNum+=("$(echo $(adb devices) | cut -d" " -f 13)")
serialNum+=("$(echo $(adb devices) | cut -d" " -f 15)")
serialNum+=("$(echo $(adb devices) | cut -d" " -f 17)")
serialNum+=("$(echo $(adb devices) | cut -d" " -f 19)")
serialNum+=("$(echo $(adb devices) | cut -d" " -f 21)")

for num in `seq 0 8`
do
{
	if [ "${serialNum[num]}" != "" ] ; then
		if [[ "$(adb -s ${serialNum[num]} shell getprop ro.product.model)" == *"$Device"* ]]; then
			echo "[${serialNum[num]}] is right device to flash!!!"
			adb -s ${serialNum[num]} reboot bootloader
		else
			echo "[${serialNum[num]}] is not support to flash!!!"
		fi
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

echo "Trying to search fastboot devices!!!"
serialNum+=("$(echo $(fastboot devices) | cut -d" " -f 1)")
serialNum+=("$(echo $(fastboot devices) | cut -d" " -f 3)")
serialNum+=("$(echo $(fastboot devices) | cut -d" " -f 5)")
serialNum+=("$(echo $(fastboot devices) | cut -d" " -f 7)")
serialNum+=("$(echo $(fastboot devices) | cut -d" " -f 9)")
serialNum+=("$(echo $(fastboot devices) | cut -d" " -f 11)")
serialNum+=("$(echo $(fastboot devices) | cut -d" " -f 13)")
serialNum+=("$(echo $(fastboot devices) | cut -d" " -f 15)")
serialNum+=("$(echo $(fastboot devices) | cut -d" " -f 17)")

a=$(date +%H:%M:%S)

for num in `seq 0 8`
do
{
	if [ "${serialNum[num]}" != "" ] ; then
		echo "Start flashing ${serialNum[num]}"
		if $mode ; then
			echo "Normal img flashing..."
			if $ABpart ; then
				if [ "${Device}" == "N722" ] ; then
					echo "AB partition flash mode phaeton"
					flashPhaeton ${serialNum[num]}
				else
					echo "AB partition flash mode"
                                        flashABpart ${serialNum[num]}
				fi
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

b=$(date +%H:%M:%S)

echo -e "Start:\t$a"
echo -e "End:\t$b"
