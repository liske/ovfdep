ovfdep
======

ovfdep helps to prepare GNU/Linux installations before converting them
to a template and configure deployed templates by the OVF environment
mechanism. This tool is developed for Debian based systems.

It is simular to virt-sysprep, although it had some other design goals.


prepare templates (dehydration)
-------------------------------

The `ovfdep clean` command prepares the system just before converting it
into a template:

- reset root password
- truncate log files
- clean up of:
    - SSH host keys
    - ntp.drift
    - .bash_history files
    - dhcp leases files
    - mail spool
    - udev persistent rules
    - urandom seed file
    - XDG .cache directories
    - /var/backups directory


deploy templates (hydration)
----------------------------

After deploying a template ovfdep prepares the system by:

- requiring to set a root password
- regenerate SSH host keys
- configure network by OVF environment data (optional; VMware specific)
