resource "google_compute_instance" "default" {
  name         = "${var.name_prefix}-jle"
  machine_type = var.instance_type
  zone         = var.instance_zone

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "${var.os_image_project}/${var.os_image_family}" #${var.os_image.project}/${var.os_image_family}"
    }
  }

  network_interface {
    network = var.vpc_name
    subnetwork = var.subnet_name

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
    user-data = file(var.cloudinit_script_path)
  }

  #desired_status = "TERMINATED"
  desired_status = "RUNNING"

}

resource "google_compute_firewall" "fw-rules" {
  name    = "${var.name_prefix}-fw-jle"
  network = var.vpc_name #google_compute_instance.default.network_interface.network.name
  direction = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["foo"]
  #IAP source_ranges = ["35.235.240.0/20"]
  
}
