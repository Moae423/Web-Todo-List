PGDMP  6    :                |            kegiatan    17.2    17.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            !           1262    16637    kegiatan    DATABASE     �   CREATE DATABASE kegiatan WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE kegiatan;
                     postgres    false            �            1259    16639    task    TABLE     [   CREATE TABLE public.task (
    id integer NOT NULL,
    kegiatan character varying(255)
);
    DROP TABLE public.task;
       public         heap r       postgres    false            �            1259    16638    task_id_seq    SEQUENCE     �   CREATE SEQUENCE public.task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.task_id_seq;
       public               postgres    false    218            "           0    0    task_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;
          public               postgres    false    217            �           2604    16642    task id    DEFAULT     b   ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);
 6   ALTER TABLE public.task ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218                      0    16639    task 
   TABLE DATA           ,   COPY public.task (id, kegiatan) FROM stdin;
    public               postgres    false    218   8
       #           0    0    task_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.task_id_seq', 23, true);
          public               postgres    false    217            �           2606    16644    task task_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
       public                 postgres    false    218                  x������ � �     