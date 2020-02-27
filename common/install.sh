## Getting Props into Vars ##

OEM=`grep_prop ro.product.brand`
DEV=`grep_prop ro.product.model`
AOS=`grep_prop ro.build.version.release`

## Compat Checks ##

ui_print "Checking Device and Build..."
ui_print ""
ui_print "OEM:		"$OEM
ui_print "DEVICE:	"$DEV
ui_print "ANDROID:	"$AOS
ui_print ""

## Running Aborts ##

if [ $OEM != "Nokia" ]
then abort "OEM Mismatch! Please use the right Module for your device."
fi

if [ $DEV != "NB1" ]
then abort "Device Mismatch! Please use the right Module for your device."
fi

if [ $AOS != "8.1.0" ] && [ $AOS != "9" ]
then abort "Android Mismatch! Please use the right Module for your device."
fi

## Installing Stuff ##

if [ $AOS == "8.1.0" ]
	then
		cp_ch $MODPATH/common/ctos.bootanimation.zip $MODPATH/system/CDA/600ID/Power-on-animation/bootanimation.zip
		cp_ch $MODPATH/common/ctos.bootanimation.zip $MODPATH/system/CDA/600WW/Power-on-animation/bootanimation.zip
fi

if [ $AOS == "9" ]
	then
		cp_ch $MODPATH/common/ctos.bootanimation.zip $MODPATH/system/product/CDA/600ID/Power-on-animation/bootanimation.zip
		cp_ch $MODPATH/common/ctos.bootanimation.zip $MODPATH/system/product/CDA/600WW/Power-on-animation/bootanimation.zip
fi

ui_print "Done!"