#!/bin/sh
./sbin/db_mgmt_cpe_dictionary.py -p
./sbin/db_mgmt_json.py -p
./sbin/db_updater.py -c
