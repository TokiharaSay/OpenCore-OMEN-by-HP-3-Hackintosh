/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLBo6Swg.aml, Mon Mar 22 10:00:14 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000A5 (165)
 *     Revision         0x02
 *     Checksum         0x01
 *     OEM ID           "DELL  "
 *     OEM Table ID     "7080__MT"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "DELL  ", "7080__MT", 0x00000000)
{
    External (_SB_.PCI0.SAT0, DeviceObj)
    External (_SB_.PCI0.SAT0.STDM, MethodObj)    // 4 Arguments

    Scope (\_SB.PCI0.SAT0)
    {
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (_OSI ("Darwin"))
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x02)
                {
                    "class-code", 
                    Buffer (0x04)
                    {
                         0x11, 0x11, 0x11, 0x11                           // ....
                    }
                })
            }
            Else
            {
                Return (^STDM (Arg0, Arg1, Arg2, Arg3))
            }
        }
    }
}

