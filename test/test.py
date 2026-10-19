# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.triggers import Timer


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # 0 + 0 = 0
    dut.a.value = 0
    dut.b.value = 0
    await Timer(10, unit="ns")
    assert dut.sum.value == 0, f"Error on first test (Sum): awaiting 0, getting {dut.sum.value}"
    assert dut.cry.value == 0, f"Error on first test (carry): awaiting 0, getting {dut.cry.value}"

    # 0 + 1 = 1
    dut.a.value = 0
    dut.b.value = 1
    await Timer(10, unit="ns")
    assert dut.sum.value == 1, f"Error on secound test (Sum): awaiting 1, getting {dut.sum.value}"
    assert dut.cry.value == 0, f"Error on secound test (carry): awaiting 0, getting {dut.cry.value}"

    # 1 + 0 = 1
    dut.a.value = 1
    dut.b.value = 0
    await Timer(10, unit="ns")
    assert dut.sum.value == 1, f"Error on third test (Sum): awaiting 1, getting {dut.sum.value}"
    assert dut.cry.value == 0, f"Error on third test (carry): awaiting 0, getting {dut.cry.value}"

    # 1 + 1 = 2 (sum = 0, carry = 1)
    dut.a.value = 1
    dut.b.value = 1
    await Timer(10, unit="ns")
    assert dut.sum.value == 0, f"Error on fourth test (Sum): awaiting 0, getting {dut.sum.value}"
    assert dut.cry.value == 1, f"Error on fourth test (carry): awaiting 1, getting {dut.cry.value}"

    dut._log.info("ALL tests passed sucessfully")
