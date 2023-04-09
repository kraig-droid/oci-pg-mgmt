resource "oci_core_instance" "instance" { # The second string is a local name
    # Required (per oracle)
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = local.tenancy_ocid
    shape = "VM.Standard.A1.Flex"
    shape_config {
        memory_in_gbs = 6
        ocpus = 1
    }
    source_details {
        source_id = "ocid1.image.oc1.us-sanjose-1.aaaaaaaalscnpbssyxbw4ribdq654vrlylqgdsvk3k5uxr6ngvkgyjzbzn5q"
        source_type = "image"
    }

    # Optional
    display_name = "p0"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = "ocid1.subnet.oc1.us-sanjose-1.aaaaaaaajlg75jvkvhvuabf7aqc6bwgekxr3uuwoox5qi5hu6w7rtqcumzuq"
    }
    metadata = {
        ssh_authorized_keys = file("~/.ssh/id_rsa.pub")
    } 
    preserve_boot_volume = false
}

