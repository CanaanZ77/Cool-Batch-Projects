# IpSniffer.py

from scapy.all import sniff, IP
import threading
import keyboard  # Import keyboard module for key events

# Global variable to control the sniffing process
sniffing_paused = threading.Event()

def packet_callback(packet):
    if not sniffing_paused.is_set():
        if packet.haslayer(IP):
            ip_layer = packet.getlayer(IP)
            print(f"Source IP: {ip_layer.src} -> Destination IP: {ip_layer.dst}")

def start_sniffing():
    global sniffing_paused
    print("Starting IP sniffer. Press 'Esc' to pause.")
    sniffing_paused.clear()  # Clear the event to start sniffing
    sniff(prn=packet_callback, store=0)

def pause_sniffing():
    global sniffing_paused
    print("Pausing IP sniffer...")
    sniffing_paused.set()  # Set the event to pause sniffing

def on_esc_pressed(event):
    global sniffing_paused
    if event.event_type == keyboard.KEY_DOWN and event.name == 'esc':
        if sniffing_paused.is_set():
            resume_sniffing()
        else:
            pause_sniffing()

def resume_sniffing():
    global sniffing_paused
    print("Resuming IP sniffer.")
    sniffing_paused.clear()  # Clear the event to resume sniffing
    # Start a new thread to resume sniffing
    threading.Thread(target=start_sniffing).start()

if __name__ == "__main__":
    keyboard.on_press(on_esc_pressed)  # Register the on_esc_pressed function to handle 'Esc' key press events

    print("Press 'Esc' to pause or 'Ctrl+C' to exit.")
    try:
        start_sniffing()
    except KeyboardInterrupt:
        print("\nExiting...")
        exit(0)
