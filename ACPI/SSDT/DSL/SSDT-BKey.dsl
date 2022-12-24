/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLmEP6tn.aml, Mon Mar 22 10:00:46 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000012F (303)
 *     Revision         0x02
 *     Checksum         0x9F
 *     OEM ID           "ACDT"
 *     OEM Table ID     "BKey"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190509 (538510601)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "BKey", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ10, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC0_.XQ11, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)

    Scope (_SB.PCI0.LPCB.EC0)
    {
        Method (_Q10, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
                Notify (\_SB.PCI0.LPCB.PS2K, 0x20) // Reserved
            }
            Else
            {
                XQ10 ()
            }
        }

        Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
                Notify (\_SB.PCI0.LPCB.PS2K, 0x10) // Reserved
            }
            Else
            {
                XQ11 ()
            }
        }
    }
}

