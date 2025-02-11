PGDMP         #                x        
   Homework09    12.1    12.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16735 
   Homework09    DATABASE     �   CREATE DATABASE "Homework09" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "Homework09";
                postgres    false            �            1259    16816    Departments    TABLE        CREATE TABLE public."Departments" (
    dept_no character varying(4) NOT NULL,
    dept_name character varying(30) NOT NULL
);
 !   DROP TABLE public."Departments";
       public         heap    postgres    false            �            1259    16829    dept_emp    TABLE     �   CREATE TABLE public.dept_emp (
    emp_no integer NOT NULL,
    dept_no character varying(4) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);
    DROP TABLE public.dept_emp;
       public         heap    postgres    false            �            1259    16826    dept_manager    TABLE     �   CREATE TABLE public.dept_manager (
    dept_no character varying(4) NOT NULL,
    emp_no integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);
     DROP TABLE public.dept_manager;
       public         heap    postgres    false            �            1259    16821 	   employees    TABLE       CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    gender character varying(1) NOT NULL,
    hire_date date NOT NULL
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    16832    salaries    TABLE     �   CREATE TABLE public.salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);
    DROP TABLE public.salaries;
       public         heap    postgres    false            �            1259    16835    titles    TABLE     �   CREATE TABLE public.titles (
    emp_no integer NOT NULL,
    title character varying(30) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);
    DROP TABLE public.titles;
       public         heap    postgres    false            �
           2606    16820    Departments pk_Departments 
   CONSTRAINT     a   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "pk_Departments" PRIMARY KEY (dept_no);
 H   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "pk_Departments";
       public            postgres    false    202            �
           2606    16825    employees pk_employees 
   CONSTRAINT     X   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (emp_no);
 @   ALTER TABLE ONLY public.employees DROP CONSTRAINT pk_employees;
       public            postgres    false    203            �
           2606    16853    dept_emp fk_dept_emp_dept_no    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no) REFERENCES public."Departments"(dept_no);
 F   ALTER TABLE ONLY public.dept_emp DROP CONSTRAINT fk_dept_emp_dept_no;
       public          postgres    false    205    2706    202            �
           2606    16848    dept_emp fk_dept_emp_emp_no    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);
 E   ALTER TABLE ONLY public.dept_emp DROP CONSTRAINT fk_dept_emp_emp_no;
       public          postgres    false    2708    205    203            �
           2606    16838 $   dept_manager fk_dept_manager_dept_no    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no) REFERENCES public."Departments"(dept_no);
 N   ALTER TABLE ONLY public.dept_manager DROP CONSTRAINT fk_dept_manager_dept_no;
       public          postgres    false    202    2706    204            �
           2606    16843 #   dept_manager fk_dept_manager_emp_no    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);
 M   ALTER TABLE ONLY public.dept_manager DROP CONSTRAINT fk_dept_manager_emp_no;
       public          postgres    false    2708    204    203            �
           2606    16858    salaries fk_salaries_emp_no    FK CONSTRAINT     �   ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);
 E   ALTER TABLE ONLY public.salaries DROP CONSTRAINT fk_salaries_emp_no;
       public          postgres    false    2708    203    206            �
           2606    16863    titles fk_titles_emp_no    FK CONSTRAINT     }   ALTER TABLE ONLY public.titles
    ADD CONSTRAINT fk_titles_emp_no FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);
 A   ALTER TABLE ONLY public.titles DROP CONSTRAINT fk_titles_emp_no;
       public          postgres    false    203    2708    207           