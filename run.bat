@echo off
tasm %1.asm
link %1.obj;
%1.exe