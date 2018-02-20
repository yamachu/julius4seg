import sys
sys.path.append('..')

from julius4seg import sp_remover
import array
import argparse
import wave


sp_remover.MARGIN = 5


def main(args: dict):
    with open(args.input_seg_file) as f:
        label = [s.strip() for s in f]
    
    sp_label = sp_remover.get_sp_segment(label)
    
    tmp = sp_remover.get_wav_sp_removed(args.wav_file, sp_label)
    
    with wave.open(args.output_wav_file, 'wb') as f:
        f.setnchannels(1)
        f.setsampwidth(2)
        f.setframerate(16000)
        f.writeframes(array.array('h' , tmp).tostring())


if __name__ == '__main__':
    parser = argparse.ArgumentParser('sp remove demo')
    
    parser.add_argument('wav_file')
    parser.add_argument('input_seg_file')
    parser.add_argument('output_wav_file')

    args = parser.parse_args()

    main(args)
