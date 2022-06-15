#!/bin/python3

import sys
import time
import logging

from watchdog.observers import Observer
from watchdog.events import LoggingEventHandler, PatternMatchingEventHandler
from skpy import SkypeEventLoop, SkypeMessageEvent

if __name__ == "__main__":
patterns = ["*"]
ignore_patterns = None
ignore_directories = False
case_sensitive = True
my_event_handler = PatternMatchinEventHandler(patterns, ignore_patterns, ignore_directories, case_sensitive)

class SkypePing(SkypeEventLoop):
def __init__(self):
super (SkypePing, self).__init__(username, password)
def on_created(self, event):
if instance(event, SkypeMessageEvent) \
and "ping" in event.msg.content:
event.msg.chat.sendMsg('Hey, {event.src_path} was just created!')

def on_deleted(self, event):
if instance(event, SkypeMessageEvent) \
and "ping" in event.msg.content:
event.msg.chat.sendMsg('What the ***? Someone deleted {event.src_path}!')

def on_modified(self, event):
if instance(event, SkypeMessageEvent) \
and "ping" in event.msg.content:
event.msg.chat.sendMsg('Hey man, someone modified {event.src_path}!')

def on_moved(self, event):
if instance(event, SkypeMessageEvent) \
and "ping" in event.msg.content:
event.msg.chat.sendMsg('Do not panic! Someone just moved {event.src_path} to {event.dest_path}!')

my_event_handler.on_created = on_created
my_event_handler.on_deleted = on_deleted
my_event_handler.on_modified = on_modified
my_event_handler.on_moved = on_moved

path = "."
go_recursively = True
my_observer = Observer()
my_observer.schedule(my_event_handler, path, recursive=go_recursively)

my_observer.start()
try:
while True:
time.sleep(1)
except KeyboardInterrupt:
my_observer.stop()
my_observer.join()
