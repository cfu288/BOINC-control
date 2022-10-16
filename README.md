# BOINC control

A simple helper script to allow us to easily change the BOINC override config with a user provided one. This is useful if you want to change the config often (like run different configs at different times of the day) and is especially helpful if you want to combine BOINC control with cron. One example is if you want to change the number of cpu's BOINC uses during the day vs night. By default, BOINC only allows you to turn all compute on or off depending on the time of day, but does not allow any further customization.

With BOINC control, you can create multiple global config files and have a cron job update which config to use depending on the time of day.

```
sudo ./boinc-control.sh <config_name>.xml
```

Add to sudo crontab `sudo crontab -e`:

```
0 23 * * * sudo <path_to_script>/boinc-control.sh gpo_high.xml
0 7 * * * sudo <path_to_script>/boinc-control.sh gpo_low.xml
```
