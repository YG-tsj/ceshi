#!/usr/bin/env bash

WireGuardStatus() {
warpwg=$(systemctl status wg-quick@wgcf | grep Active | awk 'NR==1 {print $2}')
case ${warpwg} in
active)
warpwg=yellow " 运行中 "
;
*)
warpwg=yellow " 未运行 "
;
esac
}
