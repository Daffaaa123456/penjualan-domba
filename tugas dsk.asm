.model small
.code
org 100h
start:
    jmp mulai
nama        db 13,10,'Nama Anda :$'
hp      db 13,10,'No. Hp/Telp   :$'
kode        db 13,10,'Kode/No produk yang anda pilih :$'
lanjut  db 13,10,'LANJUT Tekan y untuk lanjut>>>>>>>>>$'
tampung_nama    db 30,?,30 dup(?)
tampung_kode    db 30,?,30 dup(?)
tampung_hp  db 30,?,30 dup(?)

a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
g db 07
h db 08
i db 09
j dw 15

daftar  db 13,10,'+==========================================================+'
        db 13,10,'|     |Jual Beli Domba Qurban|             |'
        db 13,10,'+==========================================================+'
        db 13,10,'|No|Type                    |       |Harga     |'
        db 13,10,'------------------------------------------------------------'
        db 13,10,'|01|Dewasa betina           |       |Rp.3.500.000|'
        db 13,10,'|02|Dewasa Jantan           |       |Rp.3.000.000|'
        db 13,10,'+==========================================================+'
        db 13,10,'|Tentukan Pilihan Anda sesuai dengaan No/kode pada tabel   |'
        db 13,10,'+==========================================================+','$'

pilih_mtr   db 13,10,'Silahkan masukkan NO/kode yang anda pilih: $'
error       db 13,10,'KODE YANG ANDA MASUKKAN SALAH$'
succes  db 13,10,'Selamat Anda Berhasil$'

    mulai:
    mov ah,09h
    lea dx,nama
    int 21h
    mov ah,0ah
    lea dx,tampung_nama
    int 21h
    push dx 

    mov ah,09
    mov dx,offset daftar
    int 21h
    mov ah,09h
    mov dx,offset lanjut
    int 21h
    mov ah,01h
    int 21h
    cmp al,'y'

proses:

    mov ah,09h
    mov dx,offset pilih_mtr
    int 21h

    mov ah,1
    int 21h
    mov bh,al
    mov ah,1
    int 21h
    mov bl,al
    cmp bh,'0'
    cmp bl,'1'
    je hasil1

    cmp bh,'0'
    cmp bl,'2'
    je hasil2

    

;-------------------------------
hasil1:
    mov ah,09h
    lea dx,teks1
    int 21h
    int 20h

hasil2:
    mov ah,09h
    lea dx,teks2
    int 21h
    int 20h

;-------------------------------

teks1 db 13,10,'Anda memilih dewasa jantan'
    db 13,10,'Merek Eiger'
    db 13,10,'Total harga yang harus anda bayar :Rp.3.000,000'
    db 13,10,'Termikasih$'

    teks2 db 13,10,'Anda memilih dewasa betina'
    db 13,10,'Merek Eiger'
    db 13,10,'Total harga yang harus anda bayar :Rp.3.500.000'
    db 13,10,'Termikasih$'



end start

