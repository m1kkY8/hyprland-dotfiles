#! /usr/bin/env bash

sensors k10temp-pci-00c3 | grep Tctl: | awk '{print $2}'
