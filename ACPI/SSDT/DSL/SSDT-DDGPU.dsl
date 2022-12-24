/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL6G2thv.aml, Mon Mar 22 10:01:05 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000A1 (161)
 *     Revision         0x02
 *     Checksum         0xEA
 *     OEM ID           "OCLT"
 *     OEM Table ID     "DDGPU"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190509 (538510601)
 */
DefinitionBlock ("", "SSDT", 2, "OCLT", "DDGPU", 0x00000000)
{
    External (_SB_.PCI0.PEG0.PEGP._OFF, MethodObj)    // 0 Arguments

    If (_OSI ("Darwin"))
    {
        Device (DGPU)
        {
            Name (_HID, "DGPU1000")  // _HID: Hardware ID
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (CondRefOf (\_SB.PCI0.PEG0.PEGP._OFF))
                {
                    \_SB.PCI0.PEG0.PEGP._OFF ()
                }
            }
        }
    }
}

