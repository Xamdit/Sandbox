/*
  Warnings:

  - You are about to alter the column `staff_article` on the `knowledge_base` table. The data in that column could be lost. The data in that column will be cast from `Int` to `TinyInt`.

*/
-- AlterTable
ALTER TABLE `knowledge_base` MODIFY `staff_article` BOOLEAN NOT NULL DEFAULT false;
