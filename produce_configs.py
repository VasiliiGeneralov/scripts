#!/usr/bin/env python3

from argparse import ArgumentParser, Namespace
from _config_factory._config import Config
from _config_factory import _keyboard_layout as kb
from collections.abc import Callable
from typing import Dict, List


def parse_args():
    ap = ArgumentParser()

    ap.add_argument(
            '-ni',
            '--no-info',
            help='Don\'t print extra info, output configs only',
            action='store_true'
            )

    xorg_args = ap.add_argument_group('xorg-configs')
    xorg_args.add_argument(
            '-kb',
            '--keyboard-layout',
            help='Print a keyboard layout config for X',
            action='store_true'
            )

    return ap.parse_args()


def collect_config_ctors(args: Namespace) -> List[Callable[[], Config]]:
    config_ctors: List[Callable[[], Config]] = []

    for arg in vars(args):
        if 'keyboard_layout' == arg:
            config_ctors.append(kb.get)
            continue

    return config_ctors


def emit_configs(config_ctors: List[Callable[[], Config]], with_info: bool):
    for ctor in config_ctors:
        config = ctor()
        if with_info:
            print(config.info)
        print(config)


if __name__ == '__main__':
    args = parse_args()

    config_ctors: List[Callable[[], Config]] = collect_config_ctors(args)
    with_info: bool = not args.no_info

    emit_configs(config_ctors, with_info)
