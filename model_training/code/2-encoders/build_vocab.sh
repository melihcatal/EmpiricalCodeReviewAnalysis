#!/usr/bin/env bash
onmt-build-vocab --size 50000 --save_vocab src1-vocab.txt ../../datasets/2-encoders/train/src1-train.txt
onmt-build-vocab --size 50000 --save_vocab src2-vocab.txt ../../datasets/2-encoders/train/src2-train.txt
onmt-build-vocab --size 50000 --save_vocab tgt-vocab.txt ../../datasets/2-encoders/train/tgt-train.txt