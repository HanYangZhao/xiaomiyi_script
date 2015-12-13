# XIAOMI YI CONFIGURATOR (XYC)
# 
# Ini adalah SCRIPT yang bisa mengatur SCRIPT Xiaomi Yi melalui smartphone
# tanpa harus cabut kartu SD lagi ^ ^
# 
# Video Tutorial penggunaan XYC:
#   http://youtu.be/9O0ydrmMFKA
# 
# Langkah" menggunakan XYC:
#  1. Download script xyc
#     https://www.dropbox.com/s/wen9p3eau66015u/XiaomiYiConfigurator.rar?dl=0
#  2. Extract script copy 2 script ke root sdcard (sdcard xiaomi yi)
#  3. Download apps "Connect Bot" dih android melalui Playstore
#  4. Nyalakan yi cam + wifi
#  5. Connect-kan Wifi Android ke Yi Cam
#  6. Setelah connect buka apps "ConnectBot" Pilih Telnet > ketik 192.168.42.1:23 lalu ENTER
#  7. Jika sudah sampai buildroot login ketik root lalu ENTER
#  8. Ketik /tmp/fuse_d/xyc.sh (ini harus dihapal untuk menjalankan program) ENTER
#  
# SELAMAT PROGRAM TELAH BERJALAN ^_^
#  
# NB:
# XYC Modded:
# HDR Otomatis
# - Mengambil 6 Foto sekaligus dengan eksposure yang berbeda
# HDR Manual
# - Mengambil 3 Foto sekaligus dengan 3 eksposure yang bisa ditentukan sendiri
#  
# Hasil dari HDR tidak bisa langsung jadi. Harus diolah manual menggunakan Merge to HDR Pro di Photoshop.
# Tutorialnya di sini: https://www.youtube.com/watch?v=7QvTmLXVaoc
#  
# Terima kasih kepada : M Fino, Nutsey, tawbaware.com, anjar g bastian, and Mochammad Luthfi Rahmadi
# 
#


#Create Setting Directory
if [ ! -d /tmp/fuse_d/script ]; then mkdir /tmp/fuse_d/script; fi
sleep 1

PEMBERITAHUAN=/tmp/fuse_d/HarapDIBACA.txt
MANDIDULU=/tmp/fuse_d/[X]UNINSTALL.bat
LOGS=/tmp/fuse_d/script/mode.log
LANGUAGE=/tmp/fuse_d/script/lang.log
VIDD=/tmp/fuse_d/script/video.log
AASH=/tmp/fuse_d/autoexec.ash
THIS_SCRIPT=$(cd `dirname "$0"` && pwd)/`basename "$0"`
#Time-lapse params:
TLNUM=10
TLONCE="n"
TLOFF="y"
TLDELAY=12
NOUI=0
unset EXITACTION

mainscreen ()
{
  clear
  echo ""
  echo "   ******************************** "
  echo "   *    Xiaomi Yi Configurator    * "
  echo "   *  Programmer: @anjargbastian  * "
  echo "   *           Ver 4.6            * "
  echo "   ******************************** "
  echo ""
}

english()
{
Lang1="HDR Settings "
Lang2="Main Menu "
Lang3="Current HDR settings  "
Lang4="View camera settings  "
Lang5="Manual setting"
Lang6="Switch to HDR mode"
Lang7="Switch to YiMax mode"
Lang8="Switch to Long Exposure mode"
Lang8a="Set video mode settings"
Lang9="Remove/reset script  "
Lang10="View SD card capacity"
Lang11="Restart camera"
Lang12="Exit"
Lang13="Choose option"
Lang14="Input not valid"
Lang15="Input Exposure time "
Lang16="second"
Lang17="Long Exposure Settings "
Lang18="Exposure time "
Lang19="      Choose brightness       "
Lang20="Standart"
Lang21="Bright"
Lang22="Bright more"
Lang23="Extra bright"
Lang24="Superior bright"
Lang25="HDR Setting Sukses!!"
Lang26="HDR Information"
Lang27="Take 6 Photos"
Lang28="Safe from OverExp"
Lang29="Take 3 Photos"
Lang30="Set Manual exposure"
Lang31="Be carefull OverExp"
Lang32="Input first HDR Exposure"
Lang33="Input brightness"
Lang34="Input second HDR Exposure"
Lang35="Input thirth HDR Exposure "
Lang36="Function:"
Lang37=" Add real color and sharp "
Lang38="  Noise Reduce  "
Lang39="Switch to YiMax Image Optimization"
Lang40="Are you sure?"
Lang41="ISO SETTING"
Lang42="  AVOID HIGH ISO  "
Lang43="ON BRIGHT PLACES"
Lang44="Choose ISO option"
Lang45="Help"
Lang46="Take HDR photos now?"
Lang47="To take HDR photos "
Lang48="Choose switch to HDR mode again"
Lang49=" And choose (y) to take HDR!! "
Lang50="Switch mode success!"
Lang51="Please restart!!"
Lang52="Switch mode aborted!!"
Lang53=" All script removed! "
Lang54="SD card capacity:"
Lang55="File counts:"
Lang56="Estimate file capacity left:"
Lang57="Warning...option not valid:     "
Lang58="FACTORY DEFAULT"
Lang59=" View Settings "
Lang60=" Current camera settings: "
Lang61="Exposure Setting"
Lang62="   Input 0-34 to choose exposure:    "
Lang63="sec"
Lang64="ISO Setting"
Lang65="Insert ISO value:"
Lang66="     Choose exposure time : 1 - 5     "
Lang67="Exposure time "
Lang68="   Brightness   "
Lang69="  Setting success! Restart camera!!   "
Lang70="  Restart camera now   "
Lang71="Create RAW file "
Lang72="Turn on color adjustment and brightness"
Lang73="  Choose Resolution   "
Lang74="Choose resolution"
Lang75="   Choose Bitrate    "
Lang76="Choose bitrate"
}

bahasaindo()
{
Lang1="Settingan HDR"
Lang2="Menu Utama"
Lang3="Settingan HDR sekarang"
Lang4="Lihat settingan kamera"
Lang5="Setting manual"
Lang6="Beralih mode HDR"
Lang7="Beralih mode YiMax"
Lang8="Beralih mode Long Exposure"
Lang8a="Set pengaturan mode video"
Lang9="Hapus/reset script"
Lang10="Melihat kapasitas Kartu SD"
Lang11="Restart kamera"
Lang12="Keluar"
Lang13="Pilih opsi"
Lang14="Pilihan tidak valid"
Lang15="Pilih waktu Exposure"
Lang16="detik "
Lang17="Settingan Long Exposure"
Lang18="Waktu exposure"
Lang19="Silakan pilih kecerahan cahaya"
Lang20="Standar "
Lang21="Cerah "
Lang22="Lebih cerah"
Lang23="Extra cerah "
Lang24="Superior cerah "
Lang25="Setting HDR Sukses!!"
Lang26=" Informasi HDR "
Lang27="Take 6 Foto  "
Lang28="Aman dari OverExp"
Lang29="Take 3 Foto  "
Lang30="Set exposure Manual"
Lang31="Hati-hati OverExp  "
Lang32="Masukkan Exposure HDR pertama "
Lang33="Pilih kecerahan cahaya"
Lang34="Masukkan Exposure HDR kedua "
Lang35="Masukkan Exposure HDR ketiga "
Lang36=" Fungsi: "
Lang37="Warna lebih real dan tajam"
Lang38="Mengurangi noise"
Lang39="Beralih ke YiMax Image Optimization"
Lang40="Apakah anda yakin?"
Lang41="SETTING ISO"
Lang42="HINDARI ISO TINGGI"
Lang43="DI TEMPAT TERANG"
Lang44="Silakan pilih ISO"
Lang45="Bantuan"
Lang46="Take foto HDR sekarang?"
Lang47="Untuk take foto HDR"
Lang48="Pilih Beralih ke mode HDR lagi "
Lang49="Dan pilih (y) untuk take HDR!!"
Lang50="Sukses memilih mode!"
Lang51="Silakan restart!"
Lang52="Pemilihan mode batal!"
Lang53="Semua script dihapus!"
Lang54="Kapasitas Kartu SD:"
Lang55="Jumlah File:"
Lang56="Estimasi sisa kapasitas file:"
Lang57="Peringatan...opsi tidak dikenal:"
Lang58="BAWAAN PABRIK"
Lang59="Lihat Settingan"
Lang60="Settingan kamera sekarang:"
Lang61="Setting Exposure"
Lang62="Masukkan 0-34 untuk memilih exposure:"
Lang63="dtk"
Lang64="Setting ISO"
Lang65="Silakan pilih nilai ISO:"
Lang66="Pilih lama waktu exposure : 1 sampai 5"
Lang67="Waktu exposure"
Lang68="Kecerahan cahaya"
Lang69="Setting sukses! Harap restart Kamera!!"
Lang70="Restart kamera sekarang"
Lang71="Membuat file RAW"
Lang72="Hidupkan koreksi warna dan kecerahan"
Lang73="Silakan pilih Resolusi"
Lang74="Pilih resolusi"
Lang75="Silakan pilih Bitrate"
Lang76="Pilih bitrate"
}

screenhdr ()
{
  clear
  echo ""
  echo "   $DELT$DELT$DELT$DELT "
  echo "   *      $Lang1       * "
  echo "   $DELT$DELT$DELT$DELT "
 }

showMainMenu ()
{
  REPLY=-1
  while [ $REPLY -eq -1 ]
  do
    echo "$Lang2:"
    echo " [1]  $Lang4"
    echo " [2]  $Lang5"
	echo " [3]  $Lang6"
	echo " [4]  $Lang7"
    echo " [5]  $Lang8"
	echo " [6]  $Lang8a"
    echo " [7]  $Lang9"
    echo " [8]  $Lang10"
    echo " [9]  $Lang11"
    echo " [10] $Lang12"
    echo " [11] HDR 6 photos auto-start"
    echo " [12] HDR 6 photos night auto-start"

    read -p "$Lang13: " REPLY
    case $REPLY in
      0|1|2|3|4|5|6|7|8|9|10|11|12) ;;
      *) clear; echo "$Lang14"; REPLY=-1;;
    esac
  done

  clear
  return $REPLY
}

invokeProcedure ()
{
  case $1 in
    0) clear; cat $AASH;;
    1) clear; showExistingSettings;;
    2) clear; showExistingSettings; echo ""; getSettingsInput; writeAutoexec $AASH "settings";;
    3) clear; removeAutoexec; echo ""; HDRSettingsInput1; writeHDR $AASH "hdr";;
	  4) clear; removeAutoexec; echo ""; NyimakSettingsInput; writingnyimak $AASH "nyimak";;
	  5) clear; removeAutoexec; londoUzUrSettings; writelondouzur $AASH "longexpo";;
	  6) clear; videoswitch; writevideo $AASH "setvid";;
    7) clear; removeAutoexec; resetCameraSettings; showExistingSettings;;
    8) clear; showSpaceUsage;;
    9) EXITACTION="reboot";;
    10) EXITACTION="nothing";;
    11) clear; removeAutoexec; echo "";  hdr6; writeAutoexec $AASH "hdr 6 photos";;
    12) clear; removeAutoexec; echo "";  hdr6_night; writeAutoexec $AASH "hdr 6 photos night";;
  esac
}

hdr6() {

  OUTFILE=${1:-$AASH}
  SCRIPT_TYPE=${2:-"hdr"}

#Script logs
  if [ ! -f $LOGS ]; then
    touch $LOGS
    echo "mode2" > $LOGS
  SWITCHMODE=`grep "mode" $LOGS`
  elif [ -f $LOGS ]; then
    echo "mode2" > $LOGS
    SWITCHMODE=`grep "mode" $LOGS`
  fi
#End of script logs
  
#Write any necessary script commands to autoexec.ash

echo "#Turn on, auto-capture 6 stills, cricket beep " >> $OUTFILE
echo "t app test debug_dump 14" >> $OUTFILE
echo "sleep 7 " >> $OUTFILE
echo "#SET HDR TRIM LEVELS, SET GAMMA " >> $OUTFILE
echo "t ia2 -adj l_expo 163 " >> $OUTFILE
echo "t ia2 -adj autoknee 255 " >> $OUTFILE
echo "t ia2 -adj gamma 255 " >> $OUTFILE
echo "#SET ISO TO 100 " >> $OUTFILE
echo "t ia2 -ae exp 100 0 0 " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "#1/16 " >> $OUTFILE
echo "t ia2 -ae still_shutter 900 " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "t app key shutter " >> $OUTFILE
echo "sleep 3 " >> $OUTFILE
echo "#1/48 " >> $OUTFILE
echo "t ia2 -ae still_shutter 1100 " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "t app key shutter " >> $OUTFILE
echo "sleep 2 " >> $OUTFILE
echo "#1/245 " >> $OUTFILE
echo "t ia2 -ae still_shutter 1400 " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "t app key shutter " >> $OUTFILE
echo "sleep 2 " >> $OUTFILE
echo "#1/552 " >> $OUTFILE
echo "t ia2 -ae still_shutter 1550 " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "t app key shutter " >> $OUTFILE
echo "sleep 2 " >> $OUTFILE
echo "#1/1631 " >> $OUTFILE
echo "t ia2 -ae still_shutter 1750 " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "t app key shutter " >> $OUTFILE
echo "sleep 2 " >> $OUTFILE
echo "#1/8147 MIN SHUTTER " >> $OUTFILE
echo "t ia2 -ae still_shutter 2047 " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "t app key shutter " >> $OUTFILE
echo "sleep 2 " >> $OUTFILE
echo "#CRICKET BEEP " >> $OUTFILE
echo "t pwm 1 enable " >> $OUTFILE
echo "usleep 150 " >> $OUTFILE
echo "t pwm 1 disable " >> $OUTFILE
echo "usleep 150 " >> $OUTFILE
echo "t pwm 1 enable " >> $OUTFILE
echo "usleep 150 " >> $OUTFILE
echo "t pwm 1 disable " >> $OUTFILE
echo "usleep 150 " >> $OUTFILE
echo "t pwm 1 enable " >> $OUTFILE
echo "usleep 150 " >> $OUTFILE
echo "t pwm 1 disable " >> $OUTFILE
echo "usleep 150 " >> $OUTFILE
echo "t pwm 1 enable " >> $OUTFILE
echo "usleep 150 " >> $OUTFILE
echo "t pwm 1 disable " >> $OUTFILE
echo "usleep 150 " >> $OUTFILE
echo "t pwm 1 enable " >> $OUTFILE
echo "usleep 150 " >> $OUTFILE
echo "t pwm 1 disable " >> $OUTFILE
echo "#DELETE JUNK FILES. Please check if your MEDIA folder is 100MEDIA " >> $OUTFILE
echo "lu_util exec 'rm -f /tmp/fuse_d/DCIM/100MEDIA/*.TXT' " >> $OUTFILE
echo "lu_util exec 'rm -f /tmp/fuse_d/DCIM/100MEDIA/*.BIN' " >> $OUTFILE
echo "lu_util exec 'rm -f /tmp/fuse_d/DCIM/100MEDIA/*.bin' " >> $OUTFILE
echo "lu_util exec 'rm -f /tmp/fuse_d/DCIM/100MEDIA/*.UV' " >> $OUTFILE
echo "lu_util exec 'rm -f /tmp/fuse_d/DCIM/100MEDIA/*.Y' " >> $OUTFILE
showMainMenu
}

hdr6_night() {
    OUTFILE=${1:-$AASH}
  SCRIPT_TYPE=${2:-"hdr"}

#Script logs
  if [ ! -f $LOGS ]; then
    touch $LOGS
    echo "mode2" > $LOGS
  SWITCHMODE=`grep "mode" $LOGS`
  elif [ -f $LOGS ]; then
    echo "mode2" > $LOGS
    SWITCHMODE=`grep "mode" $LOGS`
  fi
#End of script logs

echo "#Turn on, auto-capture 6 JPEG stills, long beep " >> $OUTFILE
echo "t app test debug_dump 14" >> $OUTFILE
echo "sleep 7 " >> $OUTFILE
echo "#SET HDR TRIM LEVELS, SET GAMMA " >> $OUTFILE
echo "t ia2 -adj l_expo 163 " >> $OUTFILE
echo "t ia2 -adj autoknee 255 " >> $OUTFILE
echo "t ia2 -adj gamma 150 " >> $OUTFILE
echo "#SET ISO TO 400 " >> $OUTFILE
echo "t ia2 -ae exp 400 0 0 " >> $OUTFILE
echo "#SET JPEG QUALITY TO 100 " >> $OUTFILE
echo "writeb 0xC0BC205B 0x64 " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "#8 " >> $OUTFILE
echo "t ia2 -ae still_shutter 1 " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "t cal -raw 2 1 0 " >> $OUTFILE
echo "sleep 18 " >> $OUTFILE
echo "#5.4 " >> $OUTFILE
echo "t ia2 -ae still_shutter 70 " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "t cal -raw 2 1 0 " >> $OUTFILE
echo "sleep 15 " >> $OUTFILE
echo "#3.5 " >> $OUTFILE
echo "t ia2 -ae still_shutter 150 " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "t cal -raw 2 1 0 " >> $OUTFILE
echo "sleep 13 " >> $OUTFILE
echo "#1.5 " >> $OUTFILE
echo "t ia2 -ae still_shutter 300 " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "t cal -raw 2 1 0 " >> $OUTFILE
echo "sleep 12 " >> $OUTFILE
echo "#1/1.8 " >> $OUTFILE
echo "t ia2 -ae still_shutter 500 " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "t cal -raw 2 1 0 " >> $OUTFILE
echo "sleep 12 " >> $OUTFILE
echo "#1/16 " >> $OUTFILE
echo "t ia2 -ae still_shutter 900 " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "t cal -raw 2 1 0 " >> $OUTFILE
echo "sleep 10 " >> $OUTFILE
echo "#DELETE JUNK FILES. Please check if your MEDIA folder is 100MEDIA " >> $OUTFILE
echo "lu_util exec 'rm -f /tmp/fuse_d/DCIM/100MEDIA/*.TXT' " >> $OUTFILE
echo "lu_util exec 'rm -f /tmp/fuse_d/DCIM/100MEDIA/*.BIN' " >> $OUTFILE
echo "lu_util exec 'rm -f /tmp/fuse_d/DCIM/100MEDIA/*.bin' " >> $OUTFILE
echo "lu_util exec 'rm -f /tmp/fuse_d/DCIM/100MEDIA/*.UV' " >> $OUTFILE
echo "lu_util exec 'rm -f /tmp/fuse_d/DCIM/100MEDIA/*.Y' " >> $OUTFILE
echo " " >> $OUTFILE
echo "#LONG BEEP " >> $OUTFILE
echo "t pwm 1 enable " >> $OUTFILE
echo "sleep 1 " >> $OUTFILE
echo "t pwm 1 disable " >> $OUTFILE
showMainMenu
}

videoswitch()
{

 clear  
  echo "   ****************************************** "
  echo "   *        $Lang73          * "
  echo "   ****************************************** "
  echo "   *            (1) =  352x240              * "
  echo "   *            (2) =  640x360              * "
  echo "   *            (3) =  640x480              * "
  echo "   *            (4) =  720x400              * "
  echo "   *            (5) =  848x480              * "
  echo "   *            (6) = 1280x720              * "
  echo "   *            (7) = 1280x960              * "
  echo "   *            (8) = 1600x1200             * "
  echo "   *            (9) = 1920x1080             * "
  echo "   *            (10)= 2304x1296             * "
  echo "   ****************************************** "
    read -p "   $Lang74 (1/2/3/4/5/6/7/8/9/10): " REPLY
  case $REPLY in
      1|2|3|4|5|6|7|8|9|10) ;;
      *) REPLY=6;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
	resol1
		elif [[ $REPLY -eq 2 ]]; then
		resol2
			elif [[ $REPLY -eq 3 ]]; then
			resol3
				elif [[ $REPLY -eq 4 ]]; then
				resol4
					elif [[ $REPLY -eq 5 ]]; then
					resol5
						elif [[ $REPLY -eq 6 ]]; then
						resol6
							elif [[ $REPLY -eq 7 ]]; then
							resol7
								elif [[ $REPLY -eq 8 ]]; then
								resol8
									elif [[ $REPLY -eq 9 ]]; then
									resol9
										elif [[ $REPLY -eq 10 ]]; then
										resol10
    fi
  fi
}

writevideo()
{
OUTFILE=${1:-$AASH}
  SCRIPT_TYPE=${2:-"setvid"}

  VWCOMBI=1
  readvideosetting
}

writelondouzur()
{
OUTFILE=${1:-$AASH}
  SCRIPT_TYPE=${2:-"longexpo"}

#Script logs
  if [ ! -f $LOGS ]; then
    touch $LOGS
    echo "mode4" > $LOGS
	SWITCHMODE=`grep "mode" $LOGS`
  elif [ -f $LOGS ]; then
    echo "mode4" > $LOGS
    SWITCHMODE=`grep "mode" $LOGS`
  fi
#End of script logs

  #Write any necessary script commands to autoexec.ash
  echo "#Script dibuat `date`" >> $OUTFILE
  echo "" >> $OUTFILE

    echo "#Set ISO and exposure" >> $OUTFILE
    echo "t ia2 -ae exp $ISO $EXP" >> $OUTFILE
    echo "" >> $OUTFILE
    echo "#Set auto-whitebalance" >> $OUTFILE
    echo "t ia2 -awb off" >> $OUTFILE
    echo "" >> $OUTFILE
    echo "#Reduce noise reduction as much as possible" >> $OUTFILE
    echo "t ia2 -adj tidx -1 -1 -1" >> $OUTFILE
    echo "" >> $OUTFILE
	VWCOMBI=1
  readvideosetting
}

londoUzUrSettings()
{
enexpxya
dictionary
hapusmenu
}

takelongtime ()
{
  clear
  echo ""
  echo "   $DELT**$DELT$DELT*$DELT* "
  echo "   *    $UNY$DAV$SIN $ZUA $EXADE$DDDA$PES$ARE$AN    * "
  echo "   *  $DEA$AEA$JOG $DAER$KREA$JEDA$AAD$SES$DAD   * "
  echo "   *           $DCD$APA$EME $NI$TAC$TAQ            * "
  echo "   $DELT***$DELT$DELT*$DELT "
  echo ""
}

enexpxya()
{
qplowz
  read -p "   $Lang15 (1/2/3/4/5): " REPLY
  case $REPLY in
      1|2|3|4|5) ;;
      *) EXP=1; EXPVIEW="8 $Lang16";;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
      EXP=1
	  EXPVIEW="8 $Lang16"
	elif [[ $REPLY -eq 2 ]]; then
      EXP=8
	  EXPVIEW="7 $Lang16"
	elif [[ $REPLY -eq 3 ]]; then
      EXP=50
	  EXPVIEW="6 $Lang16"
	elif [[ $REPLY -eq 4 ]]; then
      EXP=84
	  EXPVIEW="5 $Lang16"
	elif [[ $REPLY -eq 5 ]]; then
      EXP=100
	  EXPVIEW="4 $Lang16"
    fi
  fi
}

tiarap()
{
  clear
  echo ""
  echo "   ****************************************** "
  echo "   *        $Lang17         * "
  echo "   ****************************************** "
  echo "   *        $Lang18= $EXPVIEW         * "
  echo "   ****************************************** "
  echo "   * $Lang19 1 - 5   * "
  echo "   *             (1) $Lang20               * "
  echo "   *             (2) $Lang21                 * "
  echo "   *             (3) $Lang22            * "
  echo "   *             (4) $Lang23           * "
  echo "   *             (5) $Lang24        * "
  echo "   ****************************************** "
  
}

showHDR1()
{
  echo "   * $Lang3:      "
  echo "   * ISO : ($ISO)             "
  echo "   * HDR1: ($HEHE1) $HDR1       "
  echo "   $DELT$DELT$DELT$DELT "
  echo ""
}

showHDR2()
{
  echo "   * $Lang3:      "
  echo "   * ISO : ($ISO)             "
  echo "   * HDR1: ($HEHE1) $HDR1       "
  echo "   * HDR2: ($HEHE2) $HDR2       "
  echo "   **************************** "
  echo ""
}

showHDR3()
{
  clear
  echo ""
  echo "   **************************** "
  echo "   *      $Lang1       * "
  echo "   **************************** "
  echo "   * $Lang3:    "
  echo "   * ISO : ($ISO)             "
  echo "   * HDR1: ($HEHE1) $HDR1       "
  echo "   * HDR2: ($HEHE2) $HDR2       "
  echo "   * HDR3: ($HEHE3) $HDR3       "
  echo "   **************************** "
  echo "   *   $Lang25   * "
  echo "   **************************** "
  echo ""
}

showHDRAuto()
{
  clear
  echo ""
  echo "   **************************** "
  echo "   *      $Lang1       * "
  echo "   **************************** "
  echo "   * HDR Auto setting:        * "
  echo "   * ISO : ($ISO)             "
  echo "   * HDR1: 900                * "
  echo "   * HDR2: 1100               * "
  echo "   * HDR3: 1400               * "
  echo "   * HDR4: 1550               * "
  echo "   * HDR5: 1750               * "
  echo "   * HDR6: 2047               * "
  echo "   **************************** "
  echo "   *   $Lang25   * "
  echo "   **************************** "
  echo ""
}

bantuanhdr()
{
  clear
  echo ""
  echo "   **************************** "
  echo "   *    $Lang26       * "
  echo "   **************************** "
  echo "   * HDR Auto setting:        * "
  echo "   * ~ $Lang27          * "
  echo "   * ~ $Lang28      * "
  echo "   *  ----------------------  * "
  echo "   * HDR Advanced settings:   * "
  echo "   * ~ $Lang29          * "
  echo "   * ~ $Lang30    * "
  echo "   * ~ $Lang31    * "
  echo "   **************************** "
  echo ""
}

getHDR1Input ()
{
  screenhdr
  showExposureValues
  read -p "Exposure: 0-34 [Enter Exposure]: " REPLY
  case $REPLY in
      0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34) ;;
      *) HDR1=0; HEHE1="Auto";;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 0 ]]; then
      HDR1=0
    HEHE1="Auto"
    elif [[ $REPLY -eq 1 ]]; then
      HDR1=1
    HEHE1="8 $Lang16"
  elif [[ $REPLY -eq 2 ]]; then
      HDR1=8
    HEHE1="7.7 $Lang16"
  elif [[ $REPLY -eq 3 ]]; then
      HDR1=50
    HEHE1="6.1 $Lang16"
  elif [[ $REPLY -eq 4 ]]; then
      HDR1=84
    HEHE1="5 $Lang16"
  elif [[ $REPLY -eq 5 ]]; then
      HDR1=100
    HEHE1="4.6 $Lang16"
  elif [[ $REPLY -eq 6 ]]; then
      HDR1=200
    HEHE1="2.7 $Lang16"
    elif [[ $REPLY -eq 7 ]]; then
      HDR1=400
    HEHE1="1 $Lang16"
    elif [[ $REPLY -eq 8 ]]; then
      HDR1=500
    HEHE1="1 $Lang16"
  elif [[ $REPLY -eq 9 ]]; then
      HDR1=590
    HEHE1="1/3 $Lang16"
    elif [[ $REPLY -eq 10 ]]; then
      HDR1=600
    HEHE1="1/5 $Lang16"
  elif [[ $REPLY -eq 11 ]]; then
      HDR1=700
    HEHE1="1/5 $Lang16"
    elif [[ $REPLY -eq 12 ]]; then
      HDR1=800
    HEHE1="1/10 $Lang16"
  elif [[ $REPLY -eq 13 ]]; then
      HDR1=900
    HEHE1="1/15 $Lang16"
  elif [[ $REPLY -eq 14 ]]; then
      HDR1=1000
    HEHE1="1/30 $Lang16"
  elif [[ $REPLY -eq 15 ]]; then
      HDR1=1100
    HEHE1="1/50 $Lang16"
    elif [[ $REPLY -eq 16 ]]; then
      HDR1=1145
    HEHE1="1/60 $Lang16"
    elif [[ $REPLY -eq 17 ]]; then
      HDR1=1200
    HEHE1="1/80 $Lang16"
    elif [[ $REPLY -eq 18 ]]; then
      HDR1=1275
    HEHE1="1/125 $Lang16"
    elif [[ $REPLY -eq 19 ]]; then
      HDR1=1300
    HEHE1="1/140 $Lang16"
    elif [[ $REPLY -eq 20 ]]; then
      HDR1=1405
    HEHE1="1/250 $Lang16"
    elif [[ $REPLY -eq 21 ]]; then
      HDR1=1450
    HEHE1="1/320 $Lang16"
    elif [[ $REPLY -eq 22 ]]; then
      HDR1=1500
    HEHE1="1/420 $Lang16"
    elif [[ $REPLY -eq 23 ]]; then
      HDR1=1531
    HEHE1="1/500 $Lang16"
    elif [[ $REPLY -eq 24 ]]; then
      HDR1=1600
    HEHE1="1/624 $Lang16"
    elif [[ $REPLY -eq 25 ]]; then
      HDR1=1607
    HEHE1="1/752 $Lang16"
    elif [[ $REPLY -eq 26 ]]; then
      HDR1=1660
    HEHE1="1/1002 $Lang16"
    elif [[ $REPLY -eq 27 ]]; then
      HDR1=1700
    HEHE1="1/1244 $Lang16"
    elif [[ $REPLY -eq 28 ]]; then
      HDR1=1750
    HEHE1="1/1630 $Lang16"
    elif [[ $REPLY -eq 29 ]]; then
      HDR1=1800
    HEHE1="1/2138 $Lang16"
    elif [[ $REPLY -eq 30 ]]; then
      HDR1=1825
    HEHE1="1/2448 $Lang16"
    elif [[ $REPLY -eq 31 ]]; then
      HDR1=1850
    HEHE1="1/2803 $Lang16"
    elif [[ $REPLY -eq 32 ]]; then
      HDR1=1900
    HEHE1="1/3675 $Lang16"
    elif [[ $REPLY -eq 33 ]]; then
      HDR1=2000
    HEHE1="1/6316 $Lang16"
    elif [[ $REPLY -eq 34 ]]; then
      HDR1=2047
    HEHE1="1/8147 $Lang16"
    fi
  fi
  
}

dictionary()
{
tiarap
  read -p "   $Lang33 (1/2/3/4/5): " REPLY
  case $REPLY in
      1|2|3|4|5) ;;
      *) ISO=100; HZET="$Lang20";;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
      ISO=100
	  HZET="$Lang20"
	elif [[ $REPLY -eq 2 ]]; then
      ISO=200
	  HZET="$Lang21"
	elif [[ $REPLY -eq 3 ]]; then
      ISO=400
	  HZET="$Lang22"
	elif [[ $REPLY -eq 4 ]]; then
      ISO=800
	  HZET="$Lang23"
	elif [[ $REPLY -eq 5 ]]; then
      ISO=1600
	  HZET="$Lang24"
    fi
  fi
}

getHDR2Input ()
{
  screenhdr
  showExposureValues
  showHDR1
  read -p "Exposure: 0-34 [Enter Exposure]: " REPLY
  case $REPLY in
      0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34) ;;
      *) HDR2=0; HEHE2="Auto";;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 0 ]]; then
      HDR2=0
    HEHE2="Auto"
    elif [[ $REPLY -eq 1 ]]; then
      HDR2=1
    HEHE2="8 $Lang16"
  elif [[ $REPLY -eq 2 ]]; then
      HDR2=8
    HEHE2="7.7 $Lang16"
  elif [[ $REPLY -eq 3 ]]; then
      HDR2=50
    HEHE2="6.1 $Lang16"
  elif [[ $REPLY -eq 4 ]]; then
      HDR2=84
    HEHE2="5 $Lang16"
  elif [[ $REPLY -eq 5 ]]; then
      HDR2=100
    HEHE2="4.6 $Lang16"
  elif [[ $REPLY -eq 6 ]]; then
      HDR2=200
    HEHE2="2.7 $Lang16"
    elif [[ $REPLY -eq 7 ]]; then
      HDR2=400
    HEHE2="1 $Lang16"
    elif [[ $REPLY -eq 8 ]]; then
      HDR2=500
    HEHE2="1 $Lang16"
  elif [[ $REPLY -eq 9 ]]; then
      HDR2=590
    HEHE2="1/3 $Lang16"
    elif [[ $REPLY -eq 10 ]]; then
      HDR2=600
    HEHE2="1/5 $Lang16"
  elif [[ $REPLY -eq 11 ]]; then
      HDR2=700
    HEHE2="1/5 $Lang16"
    elif [[ $REPLY -eq 12 ]]; then
      HDR2=800
    HEHE2="1/10 $Lang16"
  elif [[ $REPLY -eq 13 ]]; then
      HDR2=900
    HEHE2="1/15 $Lang16"
  elif [[ $REPLY -eq 14 ]]; then
      HDR2=1000
    HEHE2="1/30 $Lang16"
  elif [[ $REPLY -eq 15 ]]; then
      HDR2=1100
    HEHE2="1/50 $Lang16"
    elif [[ $REPLY -eq 16 ]]; then
      HDR2=1145
    HEHE2="1/60 $Lang16"
    elif [[ $REPLY -eq 17 ]]; then
      HDR2=1200
    HEHE2="1/80 $Lang16"
    elif [[ $REPLY -eq 18 ]]; then
      HDR2=1275
    HEHE2="1/125 $Lang16"
    elif [[ $REPLY -eq 19 ]]; then
      HDR2=1300
    HEHE2="1/140 $Lang16"
    elif [[ $REPLY -eq 20 ]]; then
      HDR2=1405
    HEHE2="1/250 $Lang16"
    elif [[ $REPLY -eq 21 ]]; then
      HDR2=1450
    HEHE2="1/320 $Lang16"
    elif [[ $REPLY -eq 22 ]]; then
      HDR2=1500
    HEHE2="1/420 $Lang16"
    elif [[ $REPLY -eq 23 ]]; then
      HDR2=1531
    HEHE2="1/500 $Lang16"
    elif [[ $REPLY -eq 24 ]]; then
      HDR2=1600
    HEHE2="1/624 $Lang16"
    elif [[ $REPLY -eq 25 ]]; then
      HDR2=1607
    HEHE2="1/752 $Lang16"
    elif [[ $REPLY -eq 26 ]]; then
      HDR2=1660
    HEHE2="1/1002 $Lang16"
    elif [[ $REPLY -eq 27 ]]; then
      HDR2=1700
    HEHE2="1/1244 $Lang16"
    elif [[ $REPLY -eq 28 ]]; then
      HDR2=1750
    HEHE2="1/1630 $Lang16"
    elif [[ $REPLY -eq 29 ]]; then
      HDR2=1800
    HEHE2="1/2138 $Lang16"
    elif [[ $REPLY -eq 30 ]]; then
      HDR2=1825
    HEHE2="1/2448 $Lang16"
    elif [[ $REPLY -eq 31 ]]; then
      HDR2=1850
    HEHE2="1/2803 $Lang16"
    elif [[ $REPLY -eq 32 ]]; then
      HDR2=1900
    HEHE2="1/3675 $Lang16"
    elif [[ $REPLY -eq 33 ]]; then
      HDR2=2000
    HEHE2="1/6316 $Lang16"
    elif [[ $REPLY -eq 34 ]]; then
      HDR2=2047
    HEHE2="1/8147 $Lang16"
    fi
  fi
}

getHDR3Input ()
{
  screenhdr
  showExposureValues
  showHDR2
  read -p "Exposure: 0-34 [Enter Exposure]: " REPLY
  case $REPLY in
      0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34) ;;
      *) HDR3=0; HEHE3="Auto";;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 0 ]]; then
      HDR3=0
    HEHE3="Auto"
    elif [[ $REPLY -eq 1 ]]; then
      HDR3=1
    HEHE3="8 $Lang16"
  elif [[ $REPLY -eq 2 ]]; then
      HDR3=8
    HEHE3="7.7 $Lang16"
  elif [[ $REPLY -eq 3 ]]; then
      HDR3=50
    HEHE3="6.1 $Lang16"
  elif [[ $REPLY -eq 4 ]]; then
      HDR3=84
    HEHE3="5 $Lang16"
  elif [[ $REPLY -eq 5 ]]; then
      HDR3=100
    HEHE3="4.6 $Lang16"
  elif [[ $REPLY -eq 6 ]]; then
      HDR3=200
    HEHE3="2.7 $Lang16"
    elif [[ $REPLY -eq 7 ]]; then
      HDR3=400
    HEHE3="1 $Lang16"
    elif [[ $REPLY -eq 8 ]]; then
      HDR3=500
    HEHE3="1 $Lang16"
  elif [[ $REPLY -eq 9 ]]; then
      HDR3=590
    HEHE3="1/3 $Lang16"
    elif [[ $REPLY -eq 10 ]]; then
      HDR3=600
    HEHE3="1/5 $Lang16"
  elif [[ $REPLY -eq 11 ]]; then
      HDR3=700
    HEHE3="1/5 $Lang16"
    elif [[ $REPLY -eq 12 ]]; then
      HDR3=800
    HEHE3="1/10 $Lang16"
  elif [[ $REPLY -eq 13 ]]; then
      HDR3=900
    HEHE3="1/15 $Lang16"
  elif [[ $REPLY -eq 14 ]]; then
      HDR3=1000
    HEHE3="1/30 $Lang16"
  elif [[ $REPLY -eq 15 ]]; then
      HDR3=1100
    HEHE3="1/50 $Lang16"
    elif [[ $REPLY -eq 16 ]]; then
      HDR3=1145
    HEHE3="1/60 $Lang16"
    elif [[ $REPLY -eq 17 ]]; then
      HDR3=1200
    HEHE3="1/80 $Lang16"
    elif [[ $REPLY -eq 18 ]]; then
      HDR3=1275
    HEHE3="1/125 $Lang16"
    elif [[ $REPLY -eq 19 ]]; then
      HDR3=1300
    HEHE3="1/140 $Lang16"
    elif [[ $REPLY -eq 20 ]]; then
      HDR3=1405
    HEHE3="1/250 $Lang16"
    elif [[ $REPLY -eq 21 ]]; then
      HDR3=1450
    HEHE3="1/320 $Lang16"
    elif [[ $REPLY -eq 22 ]]; then
      HDR3=1500
    HEHE3="1/420 $Lang16"
    elif [[ $REPLY -eq 23 ]]; then
      HDR3=1531
    HEHE3="1/500 $Lang16"
    elif [[ $REPLY -eq 24 ]]; then
      HDR3=1600
    HEHE3="1/624 $Lang16"
    elif [[ $REPLY -eq 25 ]]; then
      HDR3=1607
    HEHE3="1/752 $Lang16"
    elif [[ $REPLY -eq 26 ]]; then
      HDR3=1660
    HEHE3="1/1002 $Lang16"
    elif [[ $REPLY -eq 27 ]]; then
      HDR3=1700
    HEHE3="1/1244 $Lang16"
    elif [[ $REPLY -eq 28 ]]; then
      HDR3=1750
    HEHE3="1/1630 $Lang16"
    elif [[ $REPLY -eq 29 ]]; then
      HDR3=1800
    HEHE3="1/2138 $Lang16"
    elif [[ $REPLY -eq 30 ]]; then
      HDR3=1825
    HEHE3="1/2448 $Lang16"
    elif [[ $REPLY -eq 31 ]]; then
      HDR3=1850
    HEHE3="1/2803 $Lang16"
    elif [[ $REPLY -eq 32 ]]; then
      HDR3=1900
    HEHE3="1/3675 $Lang16"
    elif [[ $REPLY -eq 33 ]]; then
      HDR3=2000
    HEHE3="1/6316 $Lang16"
    elif [[ $REPLY -eq 34 ]]; then
      HDR3=2047
    HEHE3="1/8147 $Lang16"
    fi
  fi
}

NyimakSettingsInput()
{
  clear
     echo ""
     echo "   ****************************** "
     echo "   *  YiMax Image Optimization  * "
     echo "   ****************************** "
     echo "   *         $Lang36          * "
     echo "   * $Lang37 * "
     echo "   * in shadows and highlights  * "
     echo "   *      $Lang38      * "
     echo "   ****************************** "
     echo ""
	 echo "  $Lang39."
  read -p "  $Lang40 (y/n): " REPLY
  case $REPLY in
      y|n) ;;
      *) NYIM=0;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ "$REPLY" == "y" ]]; then
      NYIM=1
	elif [[ "$REPLY" == "n" ]]; then
      NYIM=0
    fi
  fi
}

HDRSettingsInput1 ()
{
  getHDRAutosettings
  if [[ $AUTAN -eq 0 ]]; then
  getISOInput2
  getHDR1Input
  getHDR2Input
  getHDR3Input
  fi
}

getISOInput2()
{
    clear
     echo "   **************************** "
     echo "   *      $Lang1       * "
     echo "   **************************** "
     echo "   *       $Lang41        * "
     echo "   *   $Lang42     * "
	 echo "   *    $Lang43      * "
     echo "   **************************** "
	 echo "  (1)=100,(2)=200,(3)=400,(4)=800 "
	 echo "(5)=1600,(6)=3200,(7)=6400,(8)=12800 "
	 echo ""
  read -p "$Lang44 (1/2/3/4/5/6/7/8): " REPLY
        case $REPLY in
      1|2|3|4|5|6|7|8) ;;
      *) ISO=100;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
      ISO=100
	  
	elif [[ $REPLY -eq 2 ]]; then
      ISO=200

	elif [[ $REPLY -eq 3 ]]; then
      ISO=400
	  
	elif [[ $REPLY -eq 4 ]]; then
      ISO=800
	  
	elif [[ $REPLY -eq 5 ]]; then
      ISO=1600
	  
	elif [[ $REPLY -eq 6 ]]; then
      ISO=3200
	
    elif [[ $REPLY -eq 7 ]]; then
      ISO=6400

    elif [[ $REPLY -eq 8 ]]; then
      ISO=12800
    fi
  fi
}

getHDRAutosettings()
{
     echo "   **************************** "
     echo "   *      $Lang1       * "
     echo "   **************************** "
     echo "   * 1) Auto setting HDR      * "
     echo "   * 2) Advanced setting HDR  * "
     echo "   **************************** "
	 echo "   $Lang45 (?) "
  read -p "   $Lang13 (1/2): " REPLY
  case $REPLY in
      1|2) ;;
      *) AUTAN=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [ $REPLY -eq 1 ]; then
	getISOInput2
    AUTAN=1
	  HDR1=900
	  HDR2=1550
	  HDR3=2047
	  return
	 	elif [ $REPLY -eq 2 ]; then
	AUTAN=0
	clear
    return
    elif [ "$REPLY" == "?" ]; then
	bantuanhdr
	getHDRAutosettings  
    fi
  fi
}

writeHDR ()
{
  OUTFILE=${1:-$AASH}
  SCRIPT_TYPE=${2:-"hdr"}

#Script logs
  if [ ! -f $LOGS ]; then
    touch $LOGS
    echo "mode2" > $LOGS
	SWITCHMODE=`grep "mode" $LOGS`
  elif [ -f $LOGS ]; then
    echo "mode2" > $LOGS
    SWITCHMODE=`grep "mode" $LOGS`
  fi
#End of script logs
  
  #Write any necessary script commands to autoexec.ash
  echo "#Script dibuat `date`" >> $OUTFILE
  echo "" >> $OUTFILE

echo "" >> $OUTFILE
echo "#HDR script v.2 by nutsey" >> $OUTFILE

echo "#Howto: Put this file into root of SD" >> $OUTFILE
echo "#Steady fix your Yi" >> $OUTFILE
echo "#Turn on, auto-capture 6 stills, cricket beep" >> $OUTFILE
echo "t app test debug_dump 14" >> $OUTFILE
echo "sleep 7" >> $OUTFILE
echo "#SET HDR TRIM LEVELS, SET GAMMA" >> $OUTFILE
echo "t ia2 -adj l_expo 163" >> $OUTFILE
echo "t ia2 -adj autoknee 255" >> $OUTFILE
echo "t ia2 -adj gamma 255" >> $OUTFILE
echo "#BEEP: 1 times 1-second long beep" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t pwm 1 set_level 120" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t pwm 1 enable" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t pwm 1 disable" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "#BEEP: 1 times 1-second long beep" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t pwm 1 set_level 120" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t pwm 1 enable" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t pwm 1 disable" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "#BEEP: 1 times 2-second long beep" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t pwm 1 set_level 120" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t pwm 1 enable" >> $OUTFILE
echo "sleep 2" >> $OUTFILE
echo "t pwm 1 disable" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "#SET ISO TO 100" >> $OUTFILE
echo "t ia2 -ae exp $ISO 0 0" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "#1/16" >> $OUTFILE
echo "t ia2 -ae still_shutter $HDR1" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t app key shutter" >> $OUTFILE
echo "sleep 3" >> $OUTFILE

if [[ $AUTAN -eq 1 ]]; then
echo "#1/48" >> $OUTFILE
echo "t ia2 -ae still_shutter 1100" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t app key shutter" >> $OUTFILE
echo "sleep 2" >> $OUTFILE
echo "#1/245" >> $OUTFILE
echo "t ia2 -ae still_shutter 1400" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t app key shutter" >> $OUTFILE
echo "sleep 2" >> $OUTFILE
fi

echo "#1/552" >> $OUTFILE
echo "t ia2 -ae still_shutter $HDR2" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t app key shutter" >> $OUTFILE
echo "sleep 2" >> $OUTFILE

if [[ $AUTAN -eq 1 ]]; then
echo "#1/1631" >> $OUTFILE
echo "t ia2 -ae still_shutter 1750" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t app key shutter" >> $OUTFILE
echo "sleep 2" >> $OUTFILE
fi

echo "#1/8147 MIN SHUTTER" >> $OUTFILE
echo "t ia2 -ae still_shutter $HDR3" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t app key shutter" >> $OUTFILE
echo "sleep 2" >> $OUTFILE
echo "#BEEP: 1 times 2-second long beep" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t pwm 1 set_level 120" >> $OUTFILE
echo "sleep 1" >> $OUTFILE
echo "t pwm 1 enable" >> $OUTFILE
echo "sleep 2" >> $OUTFILE
echo "t pwm 1 disable" >> $OUTFILE
if [[ $AUTAN -eq 1 ]]; then
showHDRAuto
elif [[ $AUTAN -eq 0 ]]; then
showHDR3
fi
takinghdr
}

takinghdr()
{
  read -p "$Lang46 (y/n): " REPLY
  case $REPLY in
      y|n) ;;
      *) peringatanhdr;;
    esac
  if [ -n "$REPLY" ]; then
    if [ "$REPLY" == "y" ]; then
	clear
      EXITACTION="HDR"
	elif [ "$REPLY" == "n" ]; then
      peringatanhdr
    fi
  fi
}

peringatanhdr()
{
        clear
	  echo ""
	  echo "   ********************************** "
      echo "   *      $Lang47       * "
	  echo "   *$Lang48 * "
	  echo "   * $Lang49 * "
      echo "   ********************************** "
	  echo ""
	    return
}

menu ()
{
  CHOICE=0
  while [[ -z $EXITACTION ]]
  do
    showMainMenu; CHOICE=$?
    invokeProcedure $CHOICE
  done
}

writingnyimak()
{
  OUTFILE=${1:-$AASH}
    SCRIPT_TYPE=${2:-"nyimak"}

  #Script logs
    if [ ! -f $LOGS ]; then
      touch $LOGS
      echo "mode3" > $LOGS
  	SWITCHMODE=`grep "mode" $LOGS`
    elif [ -f $LOGS ]; then
      echo "mode3" > $LOGS
      SWITCHMODE=`grep "mode" $LOGS`
    fi
  #End of script logs
    
    
  #Write any necessary script commands to autoexec.ash
  echo "#Script created `date`" >> $OUTFILE
  echo "" >> $OUTFILE
  if [[ $NYIM -eq 1 ]]; then
  echo "#BEGIN CUSTOM ASH SCRIPT" >> $OUTFILE
  echo "#YiMAX script by nutsey for 1.2.10 firmware" >> $OUTFILE
  echo "#vibrance/saturation adjustments" >> $OUTFILE
  echo "t ia2 -adj ev 10 0 60 0 0 140 0" >> $OUTFILE
  echo "#shadow/highlight clipping adjustments" >> $OUTFILE
  echo "t ia2 -adj l_expo 163" >> $OUTFILE
  echo "t ia2 -adj autoknee 255" >> $OUTFILE
  echo "#set gamma level" >> $OUTFILE
  echo "t ia2 -adj gamma 220" >> $OUTFILE
  echo "#enable raw+jpeg stills" >> $OUTFILE
  echo "t app test debug_dump 14" >> $OUTFILE
  echo "sleep 9"
  echo "#load GoPrawn config" >> $OUTFILE
  echo "t cal -ituner load d:\goprawn.config" >> $OUTFILE
  echo "sleep 1" >> $OUTFILE
  echo "#fix ae/awb/adj locks" >> $OUTFILE
  echo "t ia2 -3a 1 1 0 1" >> $OUTFILE
  echo "#ready beep"
  echo "t pwm 1 enable"
  echo "sleep 1"
  echo "t pwm 1 disable"
  echo "#END CUSTOM ASH SCRIPT" >> $OUTFILE
  fi
    VWCOMBI=1
    readvideosetting
    if [[ $NYIM -eq 1 ]]; then
    tahunyimy
    elif [[ $NYIM -eq 0 ]]; then
    tahunyimn
    fi
}

tahunyimy()
{
    clear
     echo ""
     echo "   ****************************** "
     echo "   *  YiMax Image Optimization  * "
     echo "   ****************************** "
     echo "   *    $Lang50    * "
     echo "   ****************************** "
	 echo "   *      $Lang51      * "
     echo "   ****************************** "
	 
}

tahunyimn()
{
    clear
     echo ""
     echo "   ****************************** "
     echo "   *  YiMax Image Optimization  * "
     echo "   ****************************** "
     echo "   *    $Lang52   * "
     echo "   ****************************** "
	 echo "   *    $Lang53   * "
     echo "   ****************************** "
	 echo ""
}

showSpaceUsage ()
{
    JPEG_COUNT=`find /tmp/fuse_d -name *.jpg | wc -l`
    RAW_COUNT=`find /tmp/fuse_d -name *.RAW | wc -l`
    MP4_COUNT=`find /tmp/fuse_d -name *.mp4 | wc -l`

	SPACE_TOTAL=`df -h /tmp/fuse_d | awk -F " " '/tmp/ {print $2}'`
	SPACE_USED=`df -h /tmp/fuse_d | awk -F " " '/tmp/ {print $3}'`
	SPACE_FREE=`df -h /tmp/fuse_d | awk -F " " '/tmp/ {print $4}'`
	USED_PCT=`df -h /tmp/fuse_d | awk -F " " '/tmp/ {print $5}'`

	SPACE_FREE_KB=`df -k /tmp/fuse_d | awk -F " " '/tmp/ {print $4}'`

	JPEG_LEFT=`expr $SPACE_FREE_KB / 5500`
	RAW_LEFT=`expr $SPACE_FREE_KB / 31000`
	MP4_LEFT=`expr $SPACE_FREE_KB / 88000`

	echo "$Lang54"
	echo "  Total=$SPACE_TOTAL, Used=$SPACE_USED ($USED_PCT), Free=$SPACE_FREE"
	echo ""
	echo "$Lang55"
	echo "  JPEG=$JPEG_COUNT, RAW=$RAW_COUNT, MP4=$MP4_COUNT"
	echo ""
	echo "$Lang56"
	echo "  JPEG=$JPEG_LEFT, RAW=$RAW_LEFT, MP4=$MP4_LEFT minutes"
	echo ""
}


parseCommandLine ()
{
  while [ $# -gt 0 ]
  do
    key="$1"
    case $key in
      -i) ISO=$2; shift;;
      -e) EXP=$2; shift;;
      -w) AWB=$2; shift;;
      -n) RNR=$2; shift;;
      -r) RAW=$2; shift;;
      -q) NOUI=1;;
       *) echo "$Lang57 $key"; shift;;
    esac
    shift # past argument or value
  done
}

parseExistingAutoexec ()
{
  #Parse existing values from autoexec.ash
  ISO=`grep "t ia2 -ae exp" $AASH 2>/dev/null | cut -d " " -f 5`
  EXP=`grep "t ia2 -ae exp" $AASH 2>/dev/null | cut -d " " -f 6`
  AWB=`grep "t ia2 -awb" $AASH 2>/dev/null | cut -d " " -f 4`
  RNR=`grep "t ia2 -adj tidx -1 -1 -1" $AASH 2>/dev/null`
  RAW=`grep "t app test debug_dump 14" $AASH 2>/dev/null`

  grep -q "#TimeLapseParams:" $AASH 2>/dev/null
  if [ $? -eq 0 ]; then
    TLNUM=`grep "#TimeLapseParams:" $AASH | cut -d " " -f 2`
    TLONCE=`grep "#TimeLapseParams:" $AASH | cut -d " " -f 3`
    TLOFF=`grep "#TimeLapseParams:" $AASH | cut -d " " -f 4`
    TLDELAY=`grep "#TimeLapseParams:" $AASH | cut -d " " -f 5`
  fi
}


resetCameraSettings ()
{
  unset ISO EXP AWB RAW RNR
  setMissingValues
}

setMissingValues ()
{
  #Set reasonable defaults for any missing values
  if [ -z "$ISO" ]; then ISO=0; fi
  if [ -z "$EXP" ]; then EXP=0; fi
  if [ -z "$AWB" ]; then AWB="y"; elif [ $AWB == "on" ]; then AWB="y"; else AWB="n"; fi
  if [ -z "$RNR" ]; then RNR="n"; else RNR="y"; fi
  if [ -z "$RAW" ]; then RAW="n"; else RAW="y"; fi
}


showExistingSettings()
{
  VWCOMBI=0
  readvideosetting
SWITCHMODE=`grep "mode" $LOGS`
  case $SWITCHMODE in
      mode1|mode2|mode3|mode4) ;;
      *) VIEWMODE="$Lang58";;
    esac
  if [ -n "$REPLY" ]; then
    if [[ "$SWITCHMODE" == "mode1" ]]; then
      VIEWMODE="MANUAL"
    elif [[ "$SWITCHMODE" == "mode2" ]]; then
      VIEWMODE="HDR"
    elif [[ "$SWITCHMODE" == "mode3" ]]; then
      VIEWMODE="YIMAX"
    elif [[ "$SWITCHMODE" == "mode4" ]]; then
      VIEWMODE="LONG EXPOSURE"
    fi
  fi
 clear
  echo ""
  echo "   ********************************** "
  echo "   *       $Lang59          * "
  echo "   ********************************** "
  echo "   *   $Lang60   * "
  if [ $ISO -eq 0 ]; then echo "   *        ISO: Auto (0)           * "; else echo "   *          ISO: $ISO  "; fi
  if [ $EXP -eq 0 ]; then echo "   *        Exp: Auto (0)           * "; else echo "   *          Exp: $EXPVIEW  "; fi
  if [ $AWB == "y" ]; then echo "   *           AWB: On              * "; else echo "   *           AWB: Off             * "; fi
  if [ $RNR == "y" ]; then echo "   *       Reduce NR: Y             * "; else echo "   *        Reduce NR: No           * "; fi
  if [ $RAW == "y" ]; then echo "   *          RAW: Y                * "; else echo "   *           RAW: No              * "; fi
  echo "   ********************************** "
  echo "   *   VIDEO MODE= $VIDREVIEW "
  echo "   *   PHOTO MODE= $VIEWMODE "
  echo "   ********************************** "
  echo ""
}

showExposureValues ()
{
   clear
  echo ""
  echo "   *********************************** "
  echo "   *       $Lang61          * "
  echo "***************************************** "
  echo "* $Lang62 * "
  echo "* (0)=Auto     (12)=1/10   (24)=1/624   * "
  echo "* (1)=8 $Lang63    (13)=1/15   (25)=1/752   * "
  echo "* (2)=7.7 $Lang63  (14)=1/30   (26)=1/1002  * "
  echo "* (3)=6.1 $Lang63  (15)=1/50   (27)=1/1244  * "
  echo "* (4)=5 $Lang63    (16)=1/60   (28)=1/1630  * "
  echo "* (5)=4.6 $Lang63  (17)=1/80   (29)=1/2138  * "
  echo "* (6)=2.7 $Lang63  (18)=1/125  (30)=1/2448  * "
  echo "* (7)=1 $Lang63    (19)=1/140  (31)=1/2803  * "
  echo "* (8)=1 $Lang63    (20)=1/250  (32)=1/3675  * "
  echo "* (9)=1/3 $Lang63  (21)=1/320  (33)=1/6316  * "
  echo "* (10)=1/5 $Lang63 (22)=1/420  (34)=1/8147  * "
  echo "* (11)=1/5 $Lang63 (23)=1/500  $Lang63 = $Lang16 * "
  echo "***************************************** "
}

getDelaySuggestion ()
{
  #Delay should be sum of file write time (WT) and exposure time (ET)
  #if delay is too short, then the camera doesn't write the RAW file...
  #make delay longer as necessary, depending on shutter speed and SD card
  #performance
  WT=12
  ET=0
  if [ -n $EXP ]; then
    if [ $EXP -eq 0 ]; then ET=1;
    elif [ $EXP -lt 30 ]; then ET=8;
    elif [ $EXP -lt 50 ]; then ET=7;
    elif [ $EXP -lt 90 ]; then ET=6;
    elif [ $EXP -lt 150 ]; then ET=5;
    elif [ $EXP -lt 200 ]; then ET=4;
    elif [ $EXP -lt 300 ]; then ET=3;
    elif [ $EXP -lt 400 ]; then ET=2;
    elif [ $EXP -lt 1000 ]; then ET=1;
    else ET=0;
    fi
  fi

  return `expr $WT + $ET`
}

getExposureInput ()
{
  showExposureValues
  read -p "Exposure: 0-34 [Enter Exposure]: " REPLY
  case $REPLY in
      0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34) ;;
      *) EXP=0; EXPVIEW="Auto";;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 0 ]]; then
      EXP=0
	  EXPVIEW="Auto"
    elif [[ $REPLY -eq 1 ]]; then
      EXP=1
	  EXPVIEW="8 $Lang16"
	elif [[ $REPLY -eq 2 ]]; then
      EXP=8
	  EXPVIEW="7.7 $Lang16"
	elif [[ $REPLY -eq 3 ]]; then
      EXP=50
	  EXPVIEW="6.1 $Lang16"
	elif [[ $REPLY -eq 4 ]]; then
      EXP=84
	  EXPVIEW="5 $Lang16"
	elif [[ $REPLY -eq 5 ]]; then
      EXP=100
	  EXPVIEW="4.6 $Lang16"
	elif [[ $REPLY -eq 6 ]]; then
      EXP=200
	  EXPVIEW="2.7 $Lang16"
    elif [[ $REPLY -eq 7 ]]; then
      EXP=400
	  EXPVIEW="1 $Lang16"
    elif [[ $REPLY -eq 8 ]]; then
      EXP=500
	  EXPVIEW="1 $Lang16"
	elif [[ $REPLY -eq 9 ]]; then
      EXP=590
	  EXPVIEW="1/3 $Lang16"
    elif [[ $REPLY -eq 10 ]]; then
      EXP=600
	  EXPVIEW="1/5 $Lang16"
	elif [[ $REPLY -eq 11 ]]; then
      EXP=700
	  EXPVIEW="1/5 $Lang16"
    elif [[ $REPLY -eq 12 ]]; then
      EXP=800
	  EXPVIEW="1/10 $Lang16"
	elif [[ $REPLY -eq 13 ]]; then
      EXP=900
	  EXPVIEW="1/15 $Lang16"
	elif [[ $REPLY -eq 14 ]]; then
      EXP=1000
	  EXPVIEW="1/30 $Lang16"
	elif [[ $REPLY -eq 15 ]]; then
      EXP=1100
	  EXPVIEW="1/50 $Lang16"
	  elif [[ $REPLY -eq 16 ]]; then
      EXP=1145
	  EXPVIEW="1/60 $Lang16"
	  elif [[ $REPLY -eq 17 ]]; then
      EXP=1200
	  EXPVIEW="1/80 $Lang16"
	  elif [[ $REPLY -eq 18 ]]; then
      EXP=1275
	  EXPVIEW="1/125 $Lang16"
	  elif [[ $REPLY -eq 19 ]]; then
      EXP=1300
	  EXPVIEW="1/140 $Lang16"
	  elif [[ $REPLY -eq 20 ]]; then
      EXP=1405
	  EXPVIEW="1/250 $Lang16"
	  elif [[ $REPLY -eq 21 ]]; then
      EXP=1450
	  EXPVIEW="1/320 $Lang16"
	  elif [[ $REPLY -eq 22 ]]; then
      EXP=1500
	  EXPVIEW="1/420 $Lang16"
	  elif [[ $REPLY -eq 23 ]]; then
      EXP=1531
	  EXPVIEW="1/500 $Lang16"
	  elif [[ $REPLY -eq 24 ]]; then
      EXP=1600
	  EXPVIEW="1/624 $Lang16"
	  elif [[ $REPLY -eq 25 ]]; then
      EXP=1607
	  EXPVIEW="1/752 $Lang16"
	  elif [[ $REPLY -eq 26 ]]; then
      EXP=1660
	  EXPVIEW="1/1002 $Lang16"
	  elif [[ $REPLY -eq 27 ]]; then
      EXP=1700
	  EXPVIEW="1/1244 $Lang16"
	  elif [[ $REPLY -eq 28 ]]; then
      EXP=1750
	  EXPVIEW="1/1630 $Lang16"
	  elif [[ $REPLY -eq 29 ]]; then
      EXP=1800
	  EXPVIEW="1/2138 $Lang16"
	  elif [[ $REPLY -eq 30 ]]; then
      EXP=1825
	  EXPVIEW="1/2448 $Lang16"
	  elif [[ $REPLY -eq 31 ]]; then
      EXP=1850
	  EXPVIEW="1/2803 $Lang16"
	  elif [[ $REPLY -eq 32 ]]; then
      EXP=1900
	  EXPVIEW="1/3675 $Lang16"
	  elif [[ $REPLY -eq 33 ]]; then
      EXP=2000
	  EXPVIEW="1/6316 $Lang16"
	  elif [[ $REPLY -eq 34 ]]; then
      EXP=2047
	  EXPVIEW="1/8147 $Lang16"
    fi
  fi
  
}

getISOInput ()
{
   clear
  echo ""
  echo "   *********************************** "
  echo "   *       Exposure= $EXPVIEW "
  echo "   *********************************** "
  echo "   *          $Lang64            * "
  echo "   *********************************** "
  echo "   * (1)Auto  (5)800    (9)12800     * "
  echo "   * (2)100   (6)1600   (10)25600    * "
  echo "   * (3)200   (7)3200                * "
  echo "   * (4)400   (8)6400                * "
  echo "   *********************************** "
  read -p "$Lang65 1-10: " REPLY
  case $REPLY in
      1|2|3|4|5|6|7|8|9|10) ;;
      *) ISO=0;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
      ISO=0
	elif [[ $REPLY -eq 2 ]]; then
      ISO=100
	elif [[ $REPLY -eq 3 ]]; then
      ISO=200
	elif [[ $REPLY -eq 4 ]]; then
	  ISO=400
	elif [[ $REPLY -eq 5 ]]; then
      ISO=800
	elif [[ $REPLY -eq 6 ]]; then
      ISO=1600
    elif [[ $REPLY -eq 7 ]]; then
      ISO=3200
    elif [[ $REPLY -eq 8 ]]; then
      ISO=6400
	elif [[ $REPLY -eq 9 ]]; then
      ISO=12800
    elif [[ $REPLY -eq 10 ]]; then
      ISO=25600
    fi
  fi
}

getAWBInput ()
{
   clear
     echo ""
     echo "   *********************************** "
     echo "   *       Exposure= $EXPVIEW "
     echo "   *********************************** "
	 echo "   *            ISO= $ISO "
     echo "   *********************************** "
	 echo ""
  read -p "    Auto-Whitebalance (y/n): " REPLY
  case $REPLY in
      y|n) ;;
      *) AWB="n";;
    esac
  if [ -n "$REPLY" ]; then
    if [ "$REPLY" == "y" ]; then
    AWB=$REPLY 
    elif [ "$REPLY" == "n" ]; then
    AWB=$REPLY
	fi
  fi
}

getNRInput ()
{
   clear
     echo ""
     echo "   *********************************** "
     echo "   *       Exposure= $EXPVIEW "
     echo "   *********************************** "
	 echo "   *            ISO= $ISO "
     echo "   *********************************** "
	 echo "   *            AWB= $AWB "
     echo "   *********************************** "
	 echo ""
  read -p "   Noise-reduction (y/n): " REPLY
    case $REPLY in
      y|n) ;;
      *) RNR="y";;
    esac
  if [ -n "$REPLY" ]; then
    if [ "$REPLY" == "y" ]; then
    RNR=$REPLY 
    elif [ "$REPLY" == "n" ]; then
    RNR=$REPLY
	fi
  fi
}

hapusmenu()
{
 clear
  echo ""
  echo "   ****************************************** "
  echo "   *        $Lang17         * "
  echo "   ****************************************** "
  echo "   *        $Lang67= $EXPVIEW         * "
  echo "   ****************************************** "
  echo "   *    $Lang68= $HZET    "
  echo "   ****************************************** "
  echo "   * $Lang69 * "
  echo "   ****************************************** "
  
}

ssstng()
{
  echo "   ****************************************** "
  echo "   * $Lang70 * "
  echo "   ****************************************** "
}

getRawInput ()
{
   clear
     echo ""
     echo "   *********************************** "
     echo "   *       Exposure= $EXPVIEW "
     echo "   *********************************** "
	 echo "   *            ISO= $ISO "
     echo "   *********************************** "
	 echo "   *            AWB= $AWB "
     echo "   *********************************** "
	 echo "   *            RNR= $RNR "
     echo "   *********************************** "
	 echo ""
 read -p "    $Lang71 (y/n): " REPLY
    case $REPLY in
      y|n) ;;
      *) REPLY="n";;
    esac
  if [ -n "$REPLY" ]; then
    if [ "$REPLY" == "y" ]; then
    RAW=$REPLY 
	REWO="yes"
    elif [ "$REPLY" == "n" ]; then
    RAW=$REPLY
	REWO="no"
	fi
  fi
}

getNyimInput()
{

  clear
     echo ""
     echo "   *********************************** "
     echo "   *       Exposure= $EXPVIEW "
     echo "   *********************************** "
	 echo "   *            ISO= $ISO "
     echo "   *********************************** "
	 echo "   *            AWB= $AWB "
     echo "   *********************************** "
	 echo "   *            RNR= $RNR "
     echo "   *********************************** "
	 echo "   *            RAW= $REWO "
     echo "   *********************************** "
	 echo ""
 read -p "    $Lang72 (y/n): " REPLY
    case $REPLY in
      y|n) ;;
      *) NYIM=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [ "$REPLY" == "y" ]; then
    NYIM=1
    elif [ "$REPLY" == "n" ]; then
    NYIM=2
	fi
  fi
  showExistingSettings
  ssstng
}

getTLNumShots()
{
  read -p "Enter number of shots (1-9999) [Enter=$TLNUM]: " REPLY
  if [ -n "$REPLY" ]; then TLNUM=$REPLY; fi
}

getTLOnce()
{
  read -p "Run once only? (y=once/n=multi) [Enter=$TLONCE]: " REPLY
  if [ -n "$REPLY" ]; then TLONCE=$REPLY; fi
}

getTLOff()
{
  read -p "Poweroff when complete (y/n) [Enter=$TLOFF]: " REPLY
  if [ -n "$REPLY" ]; then TLOFF=$REPLY; fi
}

getTLDelay()
{
  getDelaySuggestion
  TLDELAY=$?
  read -p "Delay between shutter press (secs) [Enter=$TLDELAY]: " REPLY
  if [ -n "$REPLY" ]; then TLDELAY=$REPLY; fi
}


getTLScriptInput ()
{
  getTLNumShots
  getTLOnce
  getTLOff
  getTLDelay
}


getSettingsInput ()
{

  SKIP=0
  getExposureInput
  if [ $SKIP -eq 1 ]; then return; fi

  getISOInput
  if [ $SKIP -eq 1 ]; then return; fi

  getAWBInput
  if [ $SKIP -eq 1 ]; then return; fi

  getNRInput
  if [ $SKIP -eq 1 ]; then return; fi

  getRawInput
  if [ $SKIP -eq 1 ]; then return; fi
  
  getNyimInput
  if [ $SKIP -eq 1 ]; then return; fi
}


removeAutoexec ()
{
  #Note: This works in "t": rm 'd:\autoexec.ash'
  rm -f /tmp/fuse_d/autoexec.ash
  #Script logs
  if [ ! -f $LOGS ]; then
    touch $LOGS
    echo "mode0" > $LOGS
	SWITCHMODE=`grep "mode" $LOGS`
  elif [ -f $LOGS ]; then
    echo "mode0" > $LOGS
    SWITCHMODE=`grep "mode" $LOGS`
  fi
  #End of script logs
  
    #Script vid
  if [ ! -f $VIDD ]; then
    touch $VIDD
    echo "vid0" > $VIDD
  elif [ -f $VIDD ]; then
    echo "vid0" > $VIDD
  fi
  #End of script vid
}

writeAutoexec ()
{
  OUTFILE=${1:-$AASH}
  SCRIPT_TYPE=${2:-"settings"}

#Script logs
  if [ ! -f $LOGS ]; then
    touch $LOGS
    echo "mode1" > $LOGS
	SWITCHMODE=`grep "mode" $LOGS`
  elif [ -f $LOGS ]; then
    echo "mode1" > $LOGS
    SWITCHMODE=`grep "mode" $LOGS`
  fi
#End of script logs
  

  #Write any necessary script commands to autoexec.ash
  echo "#Script created `date`" > $OUTFILE
  echo "#CameraParams: $ISO $EXP $AWB $RNR $RAW" >> $OUTFILE
  echo "#TimeLapseParams: $TLNUM $TLONCE $TLOFF $TLDELAY" >> $OUTFILE
  echo "" >> $OUTFILE

  if [[ $ISO -ne 0 || $EXP -ne 0 ]]; then
    echo "#Set ISO and exposure" >> $OUTFILE
    echo "t ia2 -ae exp $ISO $EXP" >> $OUTFILE
    echo "" >> $OUTFILE
  fi

  if [ $AWB == "n" ]; then
    echo "#Set auto-whitebalance" >> $OUTFILE
    echo "t ia2 -awb off" >> $OUTFILE
    echo "" >> $OUTFILE
  fi

  if [ $RNR == "y" ]; then
    echo "#Reduce noise reduction as much as possible" >> $OUTFILE
    echo "t ia2 -adj tidx -1 -1 -1" >> $OUTFILE
    echo "" >> $OUTFILE
  fi


  if [ $RAW == "y" ]; then
    echo "#Create RAW files" >> $OUTFILE
    echo "t app test debug_dump 14" >> $OUTFILE
    echo "" >> $OUTFILE
  fi

  echo "" >> $OUTFILE

    if [[ $NYIM -eq 1 ]]; then
echo "#BEGIN CUSTOM ASH SCRIPT" >> $OUTFILE
echo "#vibrance/saturation adjustments" >> $OUTFILE
echo "t ia2 -adj ev 0 0 140 0 0 150 0" >> $OUTFILE
echo "#shadow/highlight clipping adjustments" >> $OUTFILE
echo "t ia2 -adj l_expo 163" >> $OUTFILE
echo "t ia2 -adj autoknee 255" >> $OUTFILE
echo "#set gamma level" >> $OUTFILE
echo "t ia2 -adj gamma 220" >> $OUTFILE
echo "#enable 14 scene mode" >> $OUTFILE
echo "t cal -sc 14" >> $OUTFILE
echo "#END CUSTOM ASH SCRIPT" >> $OUTFILE
fi

  VWCOMBI=1
  readvideosetting
  
  #If requested, write time-lapse script
  if [ $SCRIPT_TYPE == "timelapse" ]; then
    echo "#Timelapse Script:" >> $OUTFILE
    #Pause to allow camera to boot up before starting
    echo "sleep 10" >> $OUTFILE

    CTR=0
    while [ $CTR -lt $TLNUM ];  do
      echo "t app key shutter" >> $OUTFILE
      echo "sleep $TLDELAY" >> $OUTFILE
      CTR=`expr $CTR + 1`
    done
    echo "" >> $OUTFILE

    if [ $TLONCE == "y" ]; then
      #rewrite a new autoexec.ash with current photo params
      echo "lu_util exec '$THIS_SCRIPT -i $ISO -e $EXP -w $AWB -n $RNR -r $RAW -q'" >> $OUTFILE
      echo "" >> $OUTFILE
    fi

    if [ $TLOFF == "y" ]; then
      echo "poweroff yes" >> $OUTFILE
      echo "" >> $OUTFILE
    fi
  fi
}

qplowz()
{
  clear
  echo ""
  echo "   ****************************************** "
  echo "   *        $Lang17         * "
  echo "   ****************************************** "
  echo "   * $Lang66 * "
  echo "   *             (1) 8 $Lang16               * "
  echo "   *             (2) 7 $Lang16               * "
  echo "   *             (3) 6 $Lang16               * "
  echo "   *             (4) 5 $Lang16               * "
  echo "   *             (5) 4 $Lang16               * "
  echo "   ****************************************** "
  
  }
promptToRestart ()
{
  REPLY="n"
  read -p "$Lang70 (y/n)? [Enter=$REPLY]: " REPLY
  if [ -n $REPLY ]; then
    if [ $REPLY == "y" ]; then EXITACTION="reboot"; fi
  fi
}

resol1()
{
#res 352x240
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid1" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid1" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid2" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid2" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid3" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid3" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid4" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid4" > $VIDD
                                          fi
										#End of script video
    fi
  fi
  
  }
  
resol2()
  {
#res 640x360
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid5" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid5" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid6" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid6" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid7" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid7" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid8" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid8" > $VIDD
                                          fi
										#End of script video
    fi
  fi
  }
  
resol3()
  {
  #res 640x480
clear  
  echo "   ************************************** "
  echo "   *         Silakan pilih FPS          * "
  echo "   ************************************** "
  echo "   *            (1)=24  fps             * "
  echo "   *            (2)=30  fps             * "
  echo "   *            (3)=48  fps             * "
  echo "   *            (4)=120 fps             * "
  echo "   *            (5)=240 fps             * "
  echo "   ************************************** "
    read -p "   Pilih FPS (1/2/3/4/5): " REPLY
  case $REPLY in
      1|2|3|4|5) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
       resol3a
	elif [[ $REPLY -eq 2 ]]; then
       resol3b
	elif [[ $REPLY -eq 3 ]]; then
       resol3c
	elif [[ $REPLY -eq 4 ]]; then
       resol3d
	elif [[ $REPLY -eq 5 ]]; then
       resol3e
    fi
  fi
  }
  
resol3a()
  {
  #res 640x480
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid9" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid9" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid10" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid10" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid11" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid11" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid12" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid12" > $VIDD
                                          fi
										#End of script video
    fi
  fi
  }
  
resol3b()
  {
  #res 640x480
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid13" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid13" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid14" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid14" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid15" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid15" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid16" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid16" > $VIDD
                                          fi
										#End of script video
    fi
  fi
  }
  
resol3c()
  {
  #res 640x480
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid17" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid17" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid18" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid18" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid19" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid19" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid20" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid20" > $VIDD
                                          fi
										#End of script video
    fi
  fi
  }
  
resol3d()
  {
  #res 640x480
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid21" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid21" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid22" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid22" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid23" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid23" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid24" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid24" > $VIDD
                                          fi
										#End of script video
    fi
  fi
  }
  
resol3e()
  {
  #res 640x480
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid25" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid25" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid26" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid26" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid27" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid27" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid28" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid28" > $VIDD
                                          fi
										#End of script video
    fi
  fi
  }
  
resol4()
{
#res 720x400
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid29" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid29" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid30" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid30" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid31" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid31" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid32" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid32" > $VIDD
                                          fi
										#End of script video
    fi
  fi  
}

resol5()
{
#res 848x480
clear  
  echo "   ************************************** "
  echo "   *         Silakan pilih FPS          * "
  echo "   ************************************** "
  echo "   *            (1)=48  fps             * "
  echo "   *            (2)=60  fps             * "
  echo "   *            (3)=240 fps             * "
  echo "   ************************************** "
    read -p "   Pilih FPS (1/2/3/4/5): " REPLY
  case $REPLY in
      1|2|3) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
       resol5a
	elif [[ $REPLY -eq 2 ]]; then
       resol5b
	elif [[ $REPLY -eq 3 ]]; then
       resol5c
    fi
  fi
}

resol5a()
{
#res 848x480
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid33" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid33" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid34" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid34" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid35" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid35" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid36" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid36" > $VIDD
                                          fi
										#End of script video
    fi
  fi  
}

resol5b()
{
#res 848x480
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid37" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid37" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid38" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid38" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid39" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid39" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid40" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid40" > $VIDD
                                          fi
										#End of script video
    fi
  fi  
}

resol5c()
{
#res 848x480
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid41" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid41" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid42" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid42" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid43" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid43" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid44" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid44" > $VIDD
                                          fi
										#End of script video
    fi
  fi  
}

resol6()
{
#res 1280x720
clear  
  echo "   ************************************** "
  echo "   *         Silakan pilih FPS          * "
  echo "   ************************************** "
  echo "   *            (1)=30  fps             * "
  echo "   *            (2)=48  fps             * "
  echo "   *            (3)=60  fps             * "
  echo "   *            (4)=120 fps             * "
  echo "   ************************************** "
    read -p "   Pilih FPS (1/2/3/4/5): " REPLY
  case $REPLY in
      1|2|3) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
       resol6a
	elif [[ $REPLY -eq 2 ]]; then
       resol6b
	elif [[ $REPLY -eq 3 ]]; then
       resol6c
    elif [[ $REPLY -eq 4 ]]; then
       resol6d
    fi
  fi
}

resol6a()
{
#res 1280x720
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid45" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid45" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid46" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid46" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid47" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid47" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid48" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid48" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol6b()
{
#res 1280x720
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid49" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid49" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid50" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid50" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid51" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid51" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid52" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid52" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol6c()
{
#res 1280x720
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid53" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid53" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid54" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid54" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid55" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid55" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid56" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid56" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol6d()
{
#res 1280x720
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid57" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid57" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid58" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid58" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid59" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid59" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid60" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid60" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol7()
{
#res 1280x960
clear  
  echo "   ************************************** "
  echo "   *         Silakan pilih FPS          * "
  echo "   ************************************** "
  echo "   *            (1)=24 fps              * "
  echo "   *            (2)=30 fps              * "
  echo "   *            (3)=48 fps              * "
  echo "   *            (4)=60 fps              * "
  echo "   ************************************** "
    read -p "   Pilih FPS (1/2/3/4/5): " REPLY
  case $REPLY in
      1|2|3) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
       resol7a
	elif [[ $REPLY -eq 2 ]]; then
       resol7b
	elif [[ $REPLY -eq 3 ]]; then
       resol7c
    elif [[ $REPLY -eq 4 ]]; then
       resol7d
    fi
  fi
}

resol7a()
{
#res 1280x960
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid61" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid61" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid62" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid62" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid63" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid63" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid64" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid64" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol7b()
{
#res 1280x960
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid65" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid65" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid66" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid66" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid67" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid67" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid68" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid68" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol7c()
{
#res 1280x960
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid69" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid69" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid70" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid70" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid71" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid71" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid72" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid72" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol7d()
{
#res 1280x960
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid73" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid73" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid74" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid74" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid75" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid75" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid76" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid76" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol8()
{
#res 1600x1200
clear  
  echo "   ************************************** "
  echo "   *         Silakan pilih FPS          * "
  echo "   ************************************** "
  echo "   *            (1)=24 fps              * "
  echo "   *            (2)=30 fps              * "
  echo "   *            (3)=48 fps              * "
  echo "   *            (4)=60 fps              * "
  echo "   ************************************** "
    read -p "   Pilih FPS (1/2/3/4/5): " REPLY
  case $REPLY in
      1|2|3) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
       resol8a
	elif [[ $REPLY -eq 2 ]]; then
       resol8b
	elif [[ $REPLY -eq 3 ]]; then
       resol8c
    elif [[ $REPLY -eq 4 ]]; then
       resol8d
    fi
  fi
}

resol8a()
{
#res 1600x1200
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid77" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid77" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid78" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid78" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid79" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid79" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid80" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid80" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol8b()
{
#res 1600x1200
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid81" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid81" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid82" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid82" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid83" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid83" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid84" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid84" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol8c()
{
#res 1600x1200
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid85" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid85" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid86" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid86" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid87" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid87" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid88" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid88" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol8d()
{
#res 1600x1200
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid89" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid89" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid90" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid90" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid91" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid91" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid92" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid92" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol9()
{
#res 1920x1080
clear  
  echo "   ************************************** "
  echo "   *         Silakan pilih FPS          * "
  echo "   ************************************** "
  echo "   *            (1)=24 fps              * "
  echo "   *            (2)=30 fps              * "
  echo "   *            (3)=48 fps              * "
  echo "   *            (4)=60 fps              * "
  echo "   ************************************** "
    read -p "   Pilih FPS (1/2/3/4/5): " REPLY
  case $REPLY in
      1|2|3) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
       resol9a
	elif [[ $REPLY -eq 2 ]]; then
       resol9b
	elif [[ $REPLY -eq 3 ]]; then
       resol9c
    elif [[ $REPLY -eq 4 ]]; then
       resol9d
    fi
  fi
}

resol9a()
{
#res 1920x1080
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid93" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid93" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid94" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid94" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid95" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid95" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid96" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid96" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol9b()
{
#res 1920x1080
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid97" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid97" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid98" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid98" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid99" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid99" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid100" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid100" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol9c()
{
#res 1920x1080
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid101" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid101" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid102" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid102" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid103" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid103" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid104" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid104" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol9d()
{
#res 1920x1080
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid105" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid105" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid106" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid106" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid107" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid107" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid108" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid108" > $VIDD
                                          fi
										#End of script video
    fi
  fi 
}

resol10()
{
#res 2304x1296
clear  
  echo "   ****************************************** "
  echo "   *         $Lang75          * "
  echo "   ****************************************** "
  echo "   *              (1)=20mb/s                * "
  echo "   *              (2)=25mb/s                * "
  echo "   *              (3)=30mb/s                * "
  echo "   *              (4)=35mb/s                * "
  echo "   ****************************************** "
    read -p "   $Lang76 (1/2/3/4): " REPLY
  case $REPLY in
      1|2|3|4) ;;
      *) REPLY=1;;
    esac
  if [ -n "$REPLY" ]; then
    if [[ $REPLY -eq 1 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid109" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid109" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 2 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid110" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid110" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 3 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid111" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid111" > $VIDD
                                          fi
										#End of script video
	elif [[ $REPLY -eq 4 ]]; then
                                        #Script video
                                          if [ ! -f $VIDD ]; then
                                             touch $VIDD
                                             echo "vid112" > $VIDD
                                          elif [ -f $VIDD ]; then
                                             echo "vid112" > $VIDD
                                          fi
										#End of script video
    fi
  fi
  
}

readvideosetting()
{

if [ ! -f $VIDD ]; then
READVIDEE="vid0"
elif [ -f $VIDD ]; then
READVIDEE=`grep "vid" $VIDD`
fi

if [ $READVIDEE == "vid0" ]; then
VIDREVIEW="$Lang58"
fi
	
if [ $READVIDEE == "vid1" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 352x240 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x30" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3826 0x41A0" >> $OUTFILE
fi
VIDREVIEW="352x240 30fps 20mb"
fi

if [ $READVIDEE == "vid2" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 352x240 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x30" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3826 0x41C8" >> $OUTFILE
fi
VIDREVIEW="352x240 30fps 25mb"
fi

if [ $READVIDEE == "vid3" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 352x240 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x30" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3826 0x41F0" >> $OUTFILE
fi
VIDREVIEW="352x240 30fps 30mb"
fi

if [ $READVIDEE == "vid4" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 352x240 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x30" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3826 0x420C" >> $OUTFILE
fi
VIDREVIEW="352x240 30fps 35mb"
fi

if [ $READVIDEE == "vid5" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x360 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x1A" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3496 0x41A0" >> $OUTFILE
fi
VIDREVIEW="640x360 30fps 20mb"
fi

if [ $READVIDEE == "vid6" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x360 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x1A" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3496 0x41C8" >> $OUTFILE
fi
VIDREVIEW="640x360 30fps 25mb"
fi

if [ $READVIDEE == "vid7" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x360 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x1A" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3496 0x41F0" >> $OUTFILE
fi
VIDREVIEW="640x360 30fps 30mb"
fi

if [ $READVIDEE == "vid8" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x360 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x1A" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3496 0x420C" >> $OUTFILE
fi
VIDREVIEW="640x360 30fps 35mb"
fi

if [ $READVIDEE == "vid9" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x2C" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C37F6 0x41A0" >> $OUTFILE
fi
VIDREVIEW="640x480 24fps 20mb"
fi

if [ $READVIDEE == "vid10" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x2C" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C37F6 0x41C8" >> $OUTFILE
fi
VIDREVIEW="640x480 24fps 25mb"
fi

if [ $READVIDEE == "vid11" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x2C" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C37F6 0x41F0" >> $OUTFILE
fi
VIDREVIEW="640x480 24fps 30mb"
fi

if [ $READVIDEE == "vid12" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x2C" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C37F6 0x420C" >> $OUTFILE
fi
VIDREVIEW="640x480 24fps 35mb"
fi

if [ $READVIDEE == "vid13" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x1C" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C34F6 0x41A0" >> $OUTFILE
fi
VIDREVIEW="640x480 30fps 20mb"
fi

if [ $READVIDEE == "vid14" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x1C" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C34F6 0x41C8" >> $OUTFILE
fi
VIDREVIEW="640x480 30fps 25mb"
fi

if [ $READVIDEE == "vid15" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x1C" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C34F6 0x41F0" >> $OUTFILE
fi
VIDREVIEW="640x480 30fps 30mb"
fi

if [ $READVIDEE == "vid16" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x1C" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C34F6 0x420C" >> $OUTFILE
fi
VIDREVIEW="640x480 30fps 35mb"
fi

if [ $READVIDEE == "vid17" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x2B" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C37C6 0x41A0" >> $OUTFILE
fi
VIDREVIEW="640x480 48fps 20mb"
fi

if [ $READVIDEE == "vid18" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x2B" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C37C6 0x41C8" >> $OUTFILE
fi
VIDREVIEW="640x480 48fps 25mb"
fi

if [ $READVIDEE == "vid19" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x2B" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C37C6 0x41F0" >> $OUTFILE
fi
VIDREVIEW="640x480 48fps 30mb"
fi

if [ $READVIDEE == "vid20" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x2B" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C37C6 0x420C" >> $OUTFILE
fi
VIDREVIEW="640x480 48fps 35mb"
fi

if [ $READVIDEE == "vid21" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 120fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x35" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C39A6 0x41A0" >> $OUTFILE
fi
VIDREVIEW="640x480 120fps 20mb"
fi

if [ $READVIDEE == "vid22" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 120fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x35" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C39A6 0x41C8" >> $OUTFILE
fi
VIDREVIEW="640x480 120fps 25mb"
fi

if [ $READVIDEE == "vid23" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 120fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x35" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C39A6 0x41F0" >> $OUTFILE
fi
VIDREVIEW="640x480 120fps 30mb"
fi

if [ $READVIDEE == "vid24" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 120fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x35" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C39A6 0x420C" >> $OUTFILE
fi
VIDREVIEW="640x480 120fps 35mb"
fi

if [ $READVIDEE == "vid25" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 240fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x36" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C39D6 0x41A0" >> $OUTFILE
fi
VIDREVIEW="640x480 240fps 20mb"
fi

if [ $READVIDEE == "vid26" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 240fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x36" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C39D6 0x41C8" >> $OUTFILE
fi
VIDREVIEW="640x480 240fps 25mb"
fi

if [ $READVIDEE == "vid27" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 240fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x36" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C39D6 0x41F0" >> $OUTFILE
fi
VIDREVIEW="640x480 240fps 30mb"
fi

if [ $READVIDEE == "vid28" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 640x480 240fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x36" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C39D6 0x420C" >> $OUTFILE
fi
VIDREVIEW="640x480 240fps 35mb"
fi

if [ $READVIDEE == "vid29" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 720x400 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x19" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3466 0x41A0" >> $OUTFILE
fi
VIDREVIEW="720x400 30fps 20mb"
fi

if [ $READVIDEE == "vid30" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 720x400 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x19" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3466 0x41C8" >> $OUTFILE
fi
VIDREVIEW="720x400 30fps 25mb"
fi

if [ $READVIDEE == "vid31" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 720x400 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x19" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3466 0x41F0" >> $OUTFILE
fi
VIDREVIEW="720x400 30fps 30mb"
fi

if [ $READVIDEE == "vid32" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 720x400 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x19" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3466 0x420C" >> $OUTFILE
fi
VIDREVIEW="720x400 30fps 35mb"
fi

if [ $READVIDEE == "vid33" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 848x480 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x29" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3766 0x41A0" >> $OUTFILE
fi
VIDREVIEW="848x480 48fps 20mb"
fi

if [ $READVIDEE == "vid34" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 848x480 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x29" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3766 0x41C8" >> $OUTFILE
fi
VIDREVIEW="848x480 48fps 25mb"
fi

if [ $READVIDEE == "vid35" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 848x480 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x29" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3766 0x41F0" >> $OUTFILE
fi
VIDREVIEW="848x480 48fps 30mb"
fi

if [ $READVIDEE == "vid36" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 848x480 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x29" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3766 0x420C" >> $OUTFILE
fi
VIDREVIEW="848x480 48fps 35mb"
fi

if [ $READVIDEE == "vid37" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 848x480 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x12" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3316 0x41A0" >> $OUTFILE
fi
VIDREVIEW="848x480 60fps 20mb"
fi

if [ $READVIDEE == "vid38" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 848x480 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x12" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3316 0x41C8" >> $OUTFILE
fi
VIDREVIEW="848x480 60fps 25mb"
fi

if [ $READVIDEE == "vid39" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 848x480 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x12" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3316 0x41F0" >> $OUTFILE
fi
VIDREVIEW="848x480 60fps 30mb"
fi

if [ $READVIDEE == "vid40" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 848x480 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x12" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3316 0x420C" >> $OUTFILE
fi
VIDREVIEW="848x480 60fps 35mb"
fi

if [ $READVIDEE == "vid41" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 848x480 240fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x37" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3A26 0x41A0" >> $OUTFILE
fi
VIDREVIEW="848x480 240fps 20mb"
fi

if [ $READVIDEE == "vid42" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 848x480 240fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x37" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3A26 0x41C8" >> $OUTFILE
fi
VIDREVIEW="848x480 240fps 25mb"
fi

if [ $READVIDEE == "vid43" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 848x480 240fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x37" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3A26 0x41F0" >> $OUTFILE
fi
VIDREVIEW="848x480 240fps 30mb"
fi

if [ $READVIDEE == "vid44" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 848x480 240fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x37" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3A26 0x420C" >> $OUTFILE
fi
VIDREVIEW="848x480 240fps 35mb"
fi

if [ $READVIDEE == "vid45" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x11" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C32B6 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1280x720 30fps 20mb"
fi

if [ $READVIDEE == "vid46" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x11" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C32B6 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1280x720 30fps 25mb"
fi

if [ $READVIDEE == "vid47" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x11" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C32B6 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1280x720 30fps 30mb"
fi

if [ $READVIDEE == "vid48" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x11" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C32B6 0x420C" >> $OUTFILE
fi
VIDREVIEW="1280x720 30fps 35mb"
fi

if [ $READVIDEE == "vid49" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x27" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3706 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1280x720 48fps 20mb"
fi

if [ $READVIDEE == "vid50" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x27" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3706 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1280x720 48fps 25mb"
fi

if [ $READVIDEE == "vid51" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x27" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3706 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1280x720 48fps 30mb"
fi

if [ $READVIDEE == "vid52" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x27" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3706 0x420C" >> $OUTFILE
fi
VIDREVIEW="1280x720 48fps 35mb"
fi

if [ $READVIDEE == "vid53" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x0F" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3286 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1280x720 60fps 20mb"
fi

if [ $READVIDEE == "vid54" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x0F" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3286 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1280x720 60fps 25mb"
fi

if [ $READVIDEE == "vid55" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x0F" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3286 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1280x720 60fps 30mb"
fi

if [ $READVIDEE == "vid56" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x0F" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3286 0x420C" >> $OUTFILE
fi
VIDREVIEW="1280x720 60fps 35mb"
fi

if [ $READVIDEE == "vid57" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 120fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x34" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3976 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1280x720 120fps 20mb"
fi

if [ $READVIDEE == "vid58" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 120fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x34" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3976 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1280x720 120fps 25mb"
fi

if [ $READVIDEE == "vid59" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 120fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x34" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3976 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1280x720 120fps 30mb"
fi

if [ $READVIDEE == "vid60" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x720 120fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x34" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3976 0x420C" >> $OUTFILE
fi
VIDREVIEW="1280x720 120fps 35mb"
fi

if [ $READVIDEE == "vid61" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x26" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C36D6 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1280x960 24fps 20mb"
fi

if [ $READVIDEE == "vid62" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x26" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C36D6 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1280x960 24fps 25mb"
fi

if [ $READVIDEE == "vid63" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x26" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C36D6 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1280x960 24fps 30mb"
fi

if [ $READVIDEE == "vid64" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x26" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C36D6 0x420c" >> $OUTFILE
fi
VIDREVIEW="1280x960 24fps 35mb"
fi

if [ $READVIDEE == "vid65" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x17" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3406 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1280x960 30fps 20mb"
fi

if [ $READVIDEE == "vid66" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x17" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3406 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1280x960 30fps 25mb"
fi

if [ $READVIDEE == "vid67" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x17" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3406 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1280x960 30fps 30mb"
fi

if [ $READVIDEE == "vid68" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x17" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3406 0x420C" >> $OUTFILE
fi
VIDREVIEW="1280x960 30fps 35mb"
fi

if [ $READVIDEE == "vid69" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x25" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C36A6 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1280x960 48fps 20mb"
fi

if [ $READVIDEE == "vid70" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x25" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C36A6 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1280x960 48fps 25mb"
fi

if [ $READVIDEE == "vid71" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x25" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C36A6 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1280x960 48fps 30mb"
fi

if [ $READVIDEE == "vid72" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x25" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C36A6 0x420C" >> $OUTFILE
fi
VIDREVIEW="1280x960 48fps 35mb"
fi

if [ $READVIDEE == "vid73" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x16" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C33D6 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1280x960 60fps 20mb"
fi

if [ $READVIDEE == "vid74" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x16" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C33D6 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1280x960 60fps 25mb"
fi

if [ $READVIDEE == "vid75" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x16" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C33D6 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1280x960 60fps 30mb"
fi

if [ $READVIDEE == "vid76" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1280x960 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x16" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C33D6 0x420C" >> $OUTFILE
fi
VIDREVIEW="1280x960 60fps 35mb"
fi

if [ $READVIDEE == "vid77" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x24" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3676 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1600x1200 24fps 20mb"
fi

if [ $READVIDEE == "vid78" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x24" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3676 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1600x1200 24fps 25mb"
fi

if [ $READVIDEE == "vid79" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x24" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3676 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1600x1200 24fps 30mb"
fi

if [ $READVIDEE == "vid80" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x24" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3676 0x420C" >> $OUTFILE
fi
VIDREVIEW="1600x1200 24fps 35mb"
fi

if [ $READVIDEE == "vid81" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x0D" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3226 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1600x1200 30fps 20mb"
fi

if [ $READVIDEE == "vid82" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x0D" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3226 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1600x1200 30fps 25mb"
fi

if [ $READVIDEE == "vid83" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x0D" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3226 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1600x1200 30fps 30mb"
fi

if [ $READVIDEE == "vid84" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x0D" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3226 0x420C" >> $OUTFILE
fi
VIDREVIEW="1600x1200 30fps 35mb"
fi

if [ $READVIDEE == "vid85" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x23" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3646 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1600x1200 48fps 20mb"
fi

if [ $READVIDEE == "vid86" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x23" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3646 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1600x1200 48fps 25mb"
fi

if [ $READVIDEE == "vid87" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x23" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3646 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1600x1200 48fps 30mb"
fi

if [ $READVIDEE == "vid88" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x23" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3646 0x420C" >> $OUTFILE
fi
VIDREVIEW="1600x1200 48fps 35mb"
fi

if [ $READVIDEE == "vid89" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x0C" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C31F6 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1600x1200 60fps 20mb"
fi

if [ $READVIDEE == "vid90" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x0C" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C31F6 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1600x1200 60fps 25mb"
fi

if [ $READVIDEE == "vid91" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x0C" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C31F6 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1600x1200 60fps 30mb"
fi

if [ $READVIDEE == "vid92" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1600x1200 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x0C" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C31F6 0x420c" >> $OUTFILE
fi
VIDREVIEW="1600x1200 60fps 35mb"
fi

if [ $READVIDEE == "vid93" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x21" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C35E6 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1920x1080 24fps 20mb"
fi

if [ $READVIDEE == "vid94" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x21" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C35E6 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1920x1080 24fps 25mb"
fi

if [ $READVIDEE == "vid95" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x21" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C35E6 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1920x1080 24fps 30mb"
fi

if [ $READVIDEE == "vid96" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 24fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x21" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C35E6 0x420C" >> $OUTFILE
fi
VIDREVIEW="1920x1080 24fps 35mb"
fi

if [ $READVIDEE == "vid97" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x06" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C30D6 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1920x1080 30fps 20mb"
fi

if [ $READVIDEE == "vid98" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x06" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C30D6 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1920x1080 30fps 25mb"
fi

if [ $READVIDEE == "vid99" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x06" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C30D6 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1920x1080 30fps 30mb"
fi

if [ $READVIDEE == "vid100" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x06" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C30D6 0x420C" >> $OUTFILE
fi
VIDREVIEW="1920x1080 30fps 35mb"
fi

if [ $READVIDEE == "vid101" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x20" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C35B6 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1920x1080 48fps 20mb"
fi

if [ $READVIDEE == "vid102" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x20" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C35B6 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1920x1080 48fps 25mb"
fi

if [ $READVIDEE == "vid103" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x20" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C35B6 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1920x1080 48fps 30mb"
fi

if [ $READVIDEE == "vid104" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 48fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x20" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C35B6 0x420C" >> $OUTFILE
fi
VIDREVIEW="1920x1080 48fps 35mb"
fi

if [ $READVIDEE == "vid105" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x03" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3046 0x41A0" >> $OUTFILE
fi
VIDREVIEW="1920x1080 60fps 20mb"
fi

if [ $READVIDEE == "vid106" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x03" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3046 0x41C8" >> $OUTFILE
fi
VIDREVIEW="1920x1080 60fps 25mb"
fi

if [ $READVIDEE == "vid107" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x03" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3046 0x41F0" >> $OUTFILE
fi
VIDREVIEW="1920x1080 60fps 30mb"
fi

if [ $READVIDEE == "vid108" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 1920x1080 60fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x03" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3046 0x420C" >> $OUTFILE
fi
VIDREVIEW="1920x1080 60fps 35mb"
fi

if [ $READVIDEE == "vid109" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 2304x1296 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x02" >> $OUTFILE

echo "#set bitrate to 20Mb/s" >> $OUTFILE
echo "writew 0xC05C3016 0x41A0" >> $OUTFILE
fi
VIDREVIEW="2304x1296 30fps 20mb"
fi

if [ $READVIDEE == "vid110" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 2304x1296 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x02" >> $OUTFILE

echo "#set bitrate to 25Mb/s" >> $OUTFILE
echo "writew 0xC05C3016 0x41C8" >> $OUTFILE
fi
VIDREVIEW="2304x1296 30fps 25mb"
fi

if [ $READVIDEE == "vid111" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 2304x1296 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x02" >> $OUTFILE

echo "#set bitrate to 30Mb/s" >> $OUTFILE
echo "writew 0xC05C3016 0x41F0" >> $OUTFILE
fi
VIDREVIEW="2304x1296 30fps 30mb"
fi

if [ $READVIDEE == "vid112" ]; then
if [ $VWCOMBI -eq 1 ]; then
echo "#set video resolution to 2304x1296 30fps" >> $OUTFILE
echo "writeb 0xC06CE446 0x02" >> $OUTFILE

echo "#set bitrate to 35Mb/s" >> $OUTFILE
echo "writew 0xC05C3016 0x420C" >> $OUTFILE
fi
VIDREVIEW="2304x1296 30fps 35mb"
fi

}

#Main program
parseExistingAutoexec
parseCommandLine $*
setMissingValues

#Script logs
  if [ ! -f $MANDIDULU ]; then
    touch $MANDIDULU
	cat <<! > $MANDIDULU
echo 
echo    *****************************************   
echo    *     TEKAN [ENTER] UNTUK UNINSTALL     *   
echo    *****************************************   
echo 
pause
IF EXIST "\script" (
rd \script /s /q
)
IF EXIST "\autoexec.ash" (
del "\autoexec.ash"
)
IF EXIST "\enable_info_display.script" (
del "\enable_info_display.script"
)
IF EXIST "\xyc.sh" (
del "\xyc.sh"
)
IF EXIST "\HarapDIBACA.txt" (
del "\HarapDIBACA.txt"
)
echo 
echo 
echo    *****************************************   
echo    *           UNINSTALL SUKSES!           *   
echo    *****************************************   
echo 
pause
sleep 1
del "[X]UNINSTALL.bat"
exit
!
  fi


if [ $NOUI -eq 1 ]; then
  writeAutoexec
else
  APA="e"; EME="r"; LPR="ail"; RRR="RAM"; TAQ="6";
  DAD="ian"; UNY="X"; AAD="rgba"; AN="or"; DEO="IN";
  DEA="Pro"; PES="figu"; ZUA="Yi"; JEDA="ja"; DCD="V";
  DLO="STAG"; GTA="com"; DAER="@"; DAV="ia"; SES="st";
  KREA="an"; DDDA="on"; ARE="rat"; JOG="mer:"; TAC=".";
  EXADE="C"; DELT="*******"; NI="4"; AEA="gra"; ILE="Em";
  JBE="ro"; GER="gm"; SIN="omi"; JBA="kz";
  
if [ ! -f $LANGUAGE ]; then
  clear
			  echo ""
  echo "   $DELT**$DELT$DELT*$DELT* "
  echo "   *    $UNY$DAV$SIN $ZUA $EXADE$DDDA$PES$ARE$AN    * "
  echo "   *  $DEA$AEA$JOG $DAER$KREA$JEDA$AAD$SES$DAD   * "
  echo "   *           $DCD$APA$EME $NI$TAC$TAQ            * "
  echo "   $DELT***$DELT$DELT*$DELT "
  echo ""
           read -p "   Push Enter to continue (Enter): " REPLY
                case $REPLY in
                        1) ;;
                     *) ;;
                 esac
		clear
			echo ""
            echo "   *********************************** "
            echo "   *           THANKS TO:            * "
            echo "   ***********************************  "
            echo "   *        All my friend at         * "
            echo "   *  Xiaomi Yi Indonesia Community  * "
            echo "   *********************************** "
         read -p "   Push Enter to continue (Enter): " REPLY
                 case $REPLY in
                        1) ;;
                     *) ;;
                 esac
  
  clear
  REPLY=-1
  while [ $REPLY -eq -1 ]
  do
            echo ""
	        echo "   *********************************** "
            echo "   *          INSTALATION            * "
            echo "   *        CHOOSE LANGUAGE          * "
            echo "   *********************************** "
            echo "   *        (1) English              * "
            echo "   *        (2) Bahasa Indonesia     * "
            echo "   *********************************** "
         read -p "   PLEASE CHOOSE LANGUAGE (1/2): " REPLY
                 case $REPLY in
                        1|2) ;;
                     *) clear;echo "   *   [x] PLEASE CHOOSE LANGUAGE!!  * ";REPLY=-1;;
                 esac
	done
         if [ -n "$REPLY" ]; then
             if [[ $REPLY -eq 1 ]]; then
                 LANGU=1
	         elif [[ $REPLY -eq 2 ]]; then
                 LANGU=2
             fi
         fi
  
                if [[ $LANGU -eq 1 ]]; then
                  #Script logs
                    if [ ! -f $LANGUAGE ]; then
                        touch $LANGUAGE
                        echo "lang1" > $LANGUAGE
    	                RESULTLANG=`grep "lang" $LANGUAGE`
                    elif [ -f $LANGUAGE ]; then
                        echo "lang1" > $LANGUAGE
                        RESULTLANG=`grep "lang" $LANGUAGE`
                    fi
                elif [[ $LANGU -eq 2 ]]; then
                    if [ ! -f $LANGUAGE ]; then
                        touch $LANGUAGE
                        echo "lang2" > $LANGUAGE
                        RESULTLANG=`grep "lang" $LANGUAGE`
                    elif [ -f $LANGUAGE ]; then
                        echo "lang2" > $LANGUAGE
                        RESULTLANG=`grep "lang" $LANGUAGE`
                    fi
                  #End of script logs
                fi 
fi

RESULTLANG=`grep "lang" $LANGUAGE`
 if [ "$RESULTLANG" == "lang1" ]; then
 english
 elif [ "$RESULTLANG" == "lang2" ]; then
 bahasaindo 
 fi
 
  #Script logs
  if [ ! -f $PEMBERITAHUAN ]; then
    touch $PEMBERITAHUAN
printf "   $DELT$DELT$DELT$DELT$DELT$DELT$DELT$DELT   \r\n" >> $PEMBERITAHUAN
printf "   *            $UNY$DAV$SIN $ZUA $EXADE$DDDA$PES$ARE$AN $DCD$APA$EME $NI$TAC$TAQ            *   \r\n" >> $PEMBERITAHUAN
printf "   *                UPDATE 15 Agustus 2015                *   \r\n" >> $PEMBERITAHUAN
printf "   $DELT$DELT$DELT$DELT$DELT$DELT$DELT$DELT   \r\n" >> $PEMBERITAHUAN
printf "   *      Cara UNINSTALL= Klik [X]UNINSTALL.bat           *   \r\n" >> $PEMBERITAHUAN
printf "   $DELT$DELT$DELT$DELT$DELT$DELT$DELT$DELT   \r\n" >> $PEMBERITAHUAN
printf "\r\n" >> $PEMBERITAHUAN
printf "   $DELT$DELT$DELT$DELT$DELT$DELT$DELT$DELT   \r\n" >> $PEMBERITAHUAN
printf "   *   Kontak pengembang:                                 *   \r\n" >> $PEMBERITAHUAN
printf "   *           $DEO$DLO$RRR: $DAER$KREA$JEDA$AAD$SES$DAD                  *   \r\n" >> $PEMBERITAHUAN
printf "   *           $ILE$LPR    : $KREA$JEDA$JBE$JBA$DAER$GER$LPR$TAC$GTA              *   \r\n" >> $PEMBERITAHUAN
printf "   $DELT$DELT$DELT$DELT$DELT$DELT$DELT$DELT   \r\n" >> $PEMBERITAHUAN
  fi
#End of script logs

  takelongtime
  menu
fi

if [ "$EXITACTION" == "reboot" ]; then
      echo ""
	  echo "   ********************************** "
	  echo "   *                                * "
	  echo "   *        Rebooting now...        * "
	  echo "   *                                * "
      echo "   ********************************** "
	  echo ""
  sleep 1
  reboot yes
elif [ "$EXITACTION" == "poweroff" ]; then
      echo ""
	  echo "   ********************************** "
	  echo "   *                                * "
	  echo "   *      Shutting down now...      * "
	  echo "   *                                * "
      echo "   ********************************** "
	  echo ""
  sleep 1
  poweroff yes
elif [ "$EXITACTION" == "HDR" ]; then
  	  echo ""
	  echo "   ********************************** "
      echo "   * Rebooting and auto Take HDR... * "
	  echo "   *       Please use tripod..      * "
	  echo "   *                                * "
	  echo "   *      Taking HDR picture..      * "
      echo "   ********************************** "
	  echo ""
  sleep 3
  reboot yes
fi

