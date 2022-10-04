if [ -f /etc/apcupsd/powerfail ]; then
  echo
  echo "APCUPSD will now power off the UPS"
  echo
  /etc/apcupsd/apccontrol killpower
fi
