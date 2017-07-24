# project

Embedded linux framework for DM8168 modules based on buildroot.

Supported devices: FM403C

    Сборка базового образа файловой системы и ядра

1. Клонируйте репозиорий в домашний каталог

    git clone https://github.com/insys-projects/project.git

2. Клонируем buildroot в каталог проекта

    cd ~/project
    git clone git://git.buildroot.net/buildroot

3. Создадим каталог для сборки проекта для моудля FM403C

    mkdir fm403c
    cd ./fm403c

4. Экспортируем необходимые переменные среды

    export TOOLCHAIN_EXTERNAL_CUSTOM_STRIP_COMPONENTS=3
    make BR2_EXTERNAL=../board -C ../buildroot O=$PWD fm403c_defconfig

5. Сконфигурируем систему для добавления/удаления необходимых пакетов,
   сохранив изменения перед выходом.

    make menuconfig

5.1 Распакуем архив с библиотекой BARDY в домашний каталог

    cd ~
    tar -xzvf bardy.tgz

6. Выполняем сборку

    make

 После сборки в каталоге ./fm403c/images будут файлы
 uImage - ядро linux
 rootfs.tar - архив файловой системы. Их можно использовать для
 загрузки и монтирования NFS, записи в SPI.

    Структура каталогов
 .
 ├── board
 │   ├── Config.in
 │   ├── configs
 │   │   └── fm403c_defconfig              - конфигурация buildroot для FM403C
 │   ├── external.desc
 │   ├── external.mk
 │   ├── insys
 │   │   ├── common
 │   │   │   ├── arago-env.sh
 │   │   │   ├── build-bardy.sh            - скрипт для сборки BARDY (шаг 1, перед созданием rootfs)
 │   │   │   ├── busybox.config            - конфигурация busysbox 
 │   │   │   ├── mkfs.sh                   - скрипт для подготовки rootfs (шаг 2, перед созданием rootfs)
 │   │   │   ├── patches
 │   │   │   │   └── 0001-inisys.patch     - патч для ядра Linux (arago project)
 │   │   │   └── rootfs_overlay            - оверлей файловой системы для target
 │   │   │       ├── etc
 │   │   │       │   ├── init.d
 │   │   │       │   │   ├── S51ipcdrv     - скрипт загрузки IPC драйвера из gipcy
 │   │   │       │   │   ├── S52ambpex     - скрипт загрузки драйвера устройства из BARDY
 │   │   │       │   │   └── S53srvisvi    - скрипт для запуска isvi_server
 │   │   │       │   ├── passwd
 │   │   │       │   └── profile.d
 │   │   │       │       └── env.sh        - переменные среды для target
 │   │   │       └── home
 │   │   │           └── embedded
 │   │   │               ├── bardy
 │   │   │               ├── drivers
 │   │   │               └── examples
 │   │   │                   ├── brd.ini
 │   │   │                   ├── exam_adc.ini
 │   │   │                   ├── exam_edac.ini
 │   │   │                   ├── exam_fdds.ini
 │   │   │                   └── exam_pio.ini
 │   │   └── fm403c
 │   │       └── linux.config              - конфигурация ядра linux для FM403C
 │   └── package                           - каталог с дополнительными пакетами для buildroot (не тестировалось)
 │       ├── bardy
 │       │   ├── bardy.mk
 │       │   └── Config.in
 │       └── gipcy
 │           ├── Config.in
 │           ├── gipcy.mk
 │           └── S51ipcdrv
 └── README.md
 \

