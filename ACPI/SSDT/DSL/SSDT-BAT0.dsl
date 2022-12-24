/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLDdNmHt.aml, Mon Mar 22 10:00:26 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000553 (1363)
 *     Revision         0x02
 *     Checksum         0x8D
 *     OEM ID           "ACDT"
 *     OEM Table ID     "BAT0"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190509 (538510601)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "BAT0", 0x00000000)
{
    External (_SB_.BAT0, DeviceObj)
    External (_SB_.BAT0.FABL, IntObj)
    External (_SB_.BAT0.PBIF, PkgObj)
    External (_SB_.BAT0.PBST, PkgObj)
    External (_SB_.BAT0.UPUM, MethodObj)    // 0 Arguments
    External (_SB_.BAT0.XPBI, MethodObj)    // 0 Arguments
    External (_SB_.BAT0.XPBS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.ACEL, DeviceObj)
    External (_SB_.PCI0.ACEL.XSTA, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.BACR, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.BVHB, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.BVLB, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.MBST, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.SW2S, FieldUnitObj)
    External (BRTM, FieldUnitObj)
    External (FABL, IntObj)
    External (SMA4, FieldUnitObj)

    Method (B1B2, 2, NotSerialized)
    {
        Return ((Arg0 | (Arg1 << 0x08)))
    }

    Scope (_SB.PCI0.ACEL)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (XSTA ())
            }
        }
    }

    Scope (_SB.PCI0.LPCB.EC0)
    {
        OperationRegion (ERM2, EmbeddedControl, Zero, 0xFF)
        Field (ERM2, ByteAcc, NoLock, Preserve)
        {
            Offset (0x70), 
            ADC0,   8, 
            ADC1,   8, 
            FCC0,   8, 
            FCC1,   8, 
            Offset (0x83), 
            CUR0,   8, 
            CUR1,   8, 
            BRM0,   8, 
            BRM1,   8, 
            BCV0,   8, 
            BCV1,   8
        }
    }

    Scope (_SB.BAT0)
    {
        Method (UPBI, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Local5 = B1B2 (^^PCI0.LPCB.EC0.FCC0, ^^PCI0.LPCB.EC0.FCC1)
                If ((Local5 && !(Local5 & 0x8000)))
                {
                    Local5 >>= 0x05
                    Local5 <<= 0x05
                    PBIF [One] = Local5
                    PBIF [0x02] = Local5
                    Local2 = (Local5 / 0x64)
                    Local2 += One
                    If ((B1B2 (^^PCI0.LPCB.EC0.ADC0, ^^PCI0.LPCB.EC0.ADC1) < 0x0C80))
                    {
                        Local4 = (Local2 * 0x0E)
                        PBIF [0x05] = (Local4 + 0x02)
                        Local4 = (Local2 * 0x09)
                        PBIF [0x06] = (Local4 + 0x02)
                        Local4 = (Local2 * 0x0B)
                    }
                    ElseIf ((SMA4 == One))
                    {
                        Local4 = (Local2 * 0x0C)
                        PBIF [0x05] = (Local4 + 0x02)
                        Local4 = (Local2 * 0x07)
                        PBIF [0x06] = (Local4 + 0x02)
                        Local4 = (Local2 * 0x0A)
                    }
                    Else
                    {
                        Local4 = (Local2 * 0x0C)
                        PBIF [0x05] = (Local4 + 0x02)
                        Local4 = (Local2 * 0x07)
                        PBIF [0x06] = (Local4 + 0x02)
                        Local4 = (Local2 * 0x0A)
                    }

                    FABL = (Local4 + 0x02)
                }

                Local0 = ^^PCI0.LPCB.EC0.BVLB /* External reference */
                Local1 = ^^PCI0.LPCB.EC0.BVHB /* External reference */
                Local1 <<= 0x08
                Local0 |= Local1
                PBIF [0x04] = Local0
                Sleep (0x32)
                PBIF [0x0B] = "LION"
                PBIF [0x09] = "Primary"
                UPUM ()
                PBIF [Zero] = One
            }
            Else
            {
                XPBI ()
            }
        }

        Method (UPBS, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((BRTM == One))
                {
                    Local0 = B1B2 (^^PCI0.LPCB.EC0.CUR0, ^^PCI0.LPCB.EC0.CUR1)
                    If ((Local0 & 0x8000))
                    {
                        If ((Local0 == 0xFFFF))
                        {
                            PBST [One] = 0xFFFFFFFF
                        }
                        Else
                        {
                            Local1 = ~Local0
                            Local1++
                            Local3 = (Local1 & 0xFFFF)
                            PBST [One] = Local3
                        }
                    }
                    Else
                    {
                        PBST [One] = Local0
                    }
                }
                Else
                {
                    PBST [One] = 0xFFFFFFFF
                }

                Local5 = B1B2 (^^PCI0.LPCB.EC0.BRM0, ^^PCI0.LPCB.EC0.BRM1)
                If (!(Local5 & 0x8000))
                {
                    Local5 >>= 0x05
                    Local5 <<= 0x05
                    If ((Local5 != DerefOf (PBST [0x02])))
                    {
                        PBST [0x02] = Local5
                    }
                }

                If ((!^^PCI0.LPCB.EC0.SW2S && (^^PCI0.LPCB.EC0.BACR == One)))
                {
                    PBST [0x02] = FABL /* External reference */
                }

                PBST [0x03] = B1B2 (^^PCI0.LPCB.EC0.BCV0, ^^PCI0.LPCB.EC0.BCV1)
                PBST [Zero] = ^^PCI0.LPCB.EC0.MBST /* External reference */
            }
            Else
            {
                XPBS ()
            }
        }
    }
}

